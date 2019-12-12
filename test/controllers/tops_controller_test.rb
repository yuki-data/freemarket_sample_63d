require 'test_helper'

class TopsControllerTest < ActionDispatch::IntegrationTest
  def index
    @products = Product.all
  end
end
