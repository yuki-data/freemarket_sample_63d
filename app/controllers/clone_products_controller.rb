class CloneProductsController < ApplicationController
  def new
    @product = Product.new
    5.times { @product.product_images.build }
  end
end
