require 'rails_helper'

describe PurchasesController do
  describe 'GET #index' do
    let(:user) { create(:user) }
    let(:product) { create(:product) }
    context "ログインしていない場合" do
      it "ログインページにリダイレクトする" do
        get :index, params: { product_id: product.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
    context "ログインしている場合" do
      before do
        login user
      end
      context "商品が売り切れの場合" do
        before do
          buyer = create(:user_profile)
          product.buy_product(buyer)
          get :index, params: { product_id: product.id }
        end

        it "商品詳細ページにリダイレクトする" do
          expect(response).to redirect_to product_path(product.id)
        end
      end
      context "商品が出品中の場合（売り切れていない場合）" do
        before do
          get :index, params: { product_id: product.id }
        end

        it "render #index" do
          expect(response).to render_template :index
        end

        it "@productが定義されている" do
          expect(assigns(:product)).to eq product
        end
      end
    end
  end

  describe 'POST #pay' do
    let(:user) { create(:user) }
    let(:product) { create(:product) }
    context "ログインしていない場合" do
      it "ログインページにリダイレクトする" do
        post :pay, params: { product_id: product.id }
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインしている場合" do
      before do
        login user
      end
      context "商品が売り切れの場合" do
        before do
          buyer = create(:user_profile)
          product.buy_product(buyer)
          post :pay, params: { product_id: product.id }
        end

        it "商品詳細ページにリダイレクトする" do
          expect(response).to redirect_to product_path(product.id)
        end
      end
      context "商品が出品中の場合（売り切れていない場合）" do
        context "pay-jpのトークンが存在しない場合" do
          it "ログインページにリダイレクトする" do
            post :pay, params: { product_id: product.id }
            expect(response).to redirect_to product_purchases_path(product.id)
          end
        end

        context "pay-jpのトークンが適性なテストカードのものの場合" do
          it "ログインページにリダイレクトする" do
            post :pay, params: { product_id: product.id, "payjp-token": "tok_f0cc3315d0766e60d0c0ede165d1" }
            expect(response).to redirect_to product_purchases_path(product.id)
          end
        end
        # it "render #index" do
        #   expect(response).to render_template :index
        # end

        # it "@productが定義されている" do
        #   expect(assigns(:product)).to eq product
        # end
      end
    end
  end
end
