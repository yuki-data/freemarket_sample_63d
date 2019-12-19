class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :category_select_function, only: [:new, :edit]
  before_action :set_existing_product, only: [:show, :edit, :update]

  def show
  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def create
    @product = Product.new(product_params)
    unless extract_product_images.size > 0
      flash[:exhibit_notice] = "画像は１枚以上必要です"
      redirect_to new_product_path and return
    end

    if @product.save
      extract_product_images.each do |image|
        @product.product_images.create(image: image, product_id: @product.id)
      end
      flash[:exhibit_notice] = "出品しました"
      redirect_to new_product_path
    else
      flash[:exhibit_errors] = @product.errors.messages
      redirect_to new_product_path
    end
  end

  def edit
    category_path = @product.category.path
    @category_root = category_path[0]
    @category_child = category_path[1]
    @category_grandchild = category_path[2]
  end

  def update
    unless (extract_existing_product_images.size + extract_product_images.size) > 0
      flash[:exhibit_notice] = "画像は１枚以上必要です"
      redirect_to edit_product_path(params[:id]) and return
    end
    if @product.update(product_params)
      remove_product_images
      extract_product_images.each do |image|
        @product.product_images.create(image: image, product_id: @product.id)
      end
      flash[:exhibit_notice] = "編集しました"
      redirect_to edit_product_path(params[:id])
    else
      flash[:exhibit_errors] = @product.errors.messages
      redirect_to edit_product_path(params[:id])
    end
  end

  #カテゴリー選択機能
  def category_select_function
    @category_parent_array = [{ name: "---", id: "" }]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << { name: parent.name, id: parent.id }
    end
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    @category_array = []
    category_children = Category.find(params[:category_id]).children
    category_children.each do |child|
      @category_array << { name: child.name, id: child.id }
    end
    respond_to do |format|
      format.js do
        @status = "success"
        @name = "category_child"
      end
    end
  end

  def get_category_grandchildren
    @category_array = []
    category_grandchildren = Category.find(params[:child_id]).children
    category_grandchildren.each do |child|
      @category_array << { name: child.name, id: child.id }
    end

    respond_to do |format|
      format.js do
        @status = "success"
        @name = "category_grandchild"
      end
    end
  end

  private

  def set_existing_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name, :description, :status,
      :who_charge_shipping, :way_of_shipping, :shipping_region,
      :how_long_shipping, :price, :brand
    ).merge(
      category_id: product_category_param,
      user_profile_id: current_user.user_profile.id
    )
  end

  def product_category_param
    category_params = params.require(:product).permit(:category, :category_child, :category_grandchild)
    category_params[:category_grandchild] || category_params[:category_child] || category_params[:category]
  end

  def product_image_param
    params.require(:product)["product_images_attributes"] || []
  end

  def extract_product_images
    images_array = []
    product_image_param.each do |index, image|
      if image[:image]
        images_array << image[:image][0]
      end
    end
    images_array
  end

  def extract_existing_product_images
    images_ids_array = []
    product_image_param.each do |index, image|
      if image[:id]
        images_ids_array << image[:id].to_i
      end
    end
    images_ids_array
  end

  def remove_product_images
    @product.product_image_ids.each do |i|
      unless extract_existing_product_images.include?(i)
        @product.product_images.destroy(i)
      end
    end
  end
end
