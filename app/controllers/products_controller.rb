class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :category_select_function, only: [:new, :create]
  before_action :set_new_product, only: [:new, :create]

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    @category_child_array = @product.category.parent.parent.children
    @category_grandchild_array = @product.category.parent.children
  end

  def update
    brand = Brand.new(name: params.require(:product)[:brand][:name])
    category_name = params[:category] || params.require(:product)[:category]
    category = Category.find_by(name: category_name)
    if !brand.save || !category
      redirect_to edit_product_path(params[:id]) and return
    end
    product_params = product_parameter.merge(
      brand_id: brand.id,
      category_id: category.id,
      user_profile_id: current_user.user_profile.id
    )
    product = Product.find(params[:id])
    if product.update(product_params)
      if params.require(:product)["product_images_attributes"].present?
        image_ids = []
        params.require(:product)["product_images_attributes"].each do |index, dict|
          image_ids << dict[:id].to_i
        end
        product.product_image_ids.each do |i|
          unless image_ids.include?(i)
            product.product_images.destroy(i)
          end
        end
      end
      if params[:product_images]
        params[:product_images][:image].each do |image|
          ProductImage.create(image: image, product_id: product.id)
        end
      end
      redirect_to product_path(params[:id])
    else
      redirect_to edit_product_path(params[:id])
    end
  end

  def set_new_product
    @product = Product.new
    @product.product_images.build
  end

  def new
  end

  def create
    brand = Brand.new(name: params.require(:product)[:brand])
    category_name = params[:category] || params.require(:product)[:category]
    category = Category.find_by(name: category_name)
    if !brand.save || !category
      redirect_to new_product_path and return
    end

    product_params = product_parameter.merge(
      brand_id: brand.id,
      category_id: category.id,
      user_profile_id: current_user.user_profile.id
    )
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        params[:product_images][:image].each do |image|
          @product.product_images.create(image: image, product_id: @product.id)
        end
        format.html{redirect_to root_path}
      else
        format.html{redirect_to new_product_path}
      end
    end
  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  # 配送料の負担が選ばれた後のアクション
  def get_shipping_method
  end

  #出品に必要なデータ型の指定
  def product_parameter
    #最後に、.merge(user_id: current_user.id)をユーザー設定終わったらつける
    params.require(:product).permit(
      :name, :description, :status, :who_charge_shipping,
      :way_of_shipping, :shipping_region, :how_long_shipping, :price,
      # product_images_attributes: [:image]
    )
  end

  #カテゴリー選択機能
  def category_select_function
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

end
