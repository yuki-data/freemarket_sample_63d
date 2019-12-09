class PurchasesController < ApplicationController
  # 購入画面はログインユーザーのみに表示
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :pay]
  before_action :redirect_if_already_bought, only: [:index, :pay]

  def index
    @PAYJP_PUBLIC_KEY = ENV['PAYJP_PUBLIC_KEY']
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    begin
      charge = Payjp::Charge.create(
        amount: @product.price, # 決済する値段
        card: params['payjp-token'],
        currency: 'jpy'
      )
      @product.buy_product(current_user.user_profile)
      redirect_to root_path, notice: "購入しました"
    rescue Payjp::CardError => e
      redirect_with_flash("カードが無効であるか支払額が限度を超えています")
    rescue Payjp::InvalidRequestError => e
      redirect_with_flash("入力に間違いがあります")
    rescue Payjp::AuthenticationError => e
      redirect_with_flash("認証に失敗しました")
    rescue Payjp::APIConnectionError => e
      redirect_with_flash("通信に失敗しました")
    rescue Payjp::PayjpError => e
      redirect_with_flash("決済に失敗しました。窓口に問い合わせてください。")
    rescue => e
      redirect_with_flash("決済に失敗しました。窓口に問い合わせてください。")
    end
  end

  def redirect_with_flash(alert_message)
    flash[:payment_alert] = alert_message
    redirect_to product_purchases_path(params[:product_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def redirect_if_already_bought
    if @product.bought_product.present? || @product.saling_product.blank?
      redirect_to root_path
    end
  end
end
