require 'rails_helper'

describe PurchasesController do
  describe 'GET #index' do
    it "renders the :index template" do
      product = build(:product)
      binding.pry
      # get :index
      # expect(response).to render_template :new
    end
  end
end