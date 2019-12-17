class CloneProductsController < ApplicationController
  before_action :category_select_function, only: [:new]
  def new
    @product = Product.new
    # 5.times { @product.product_images.build }
  end

  def create
    binding.pry
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
end
