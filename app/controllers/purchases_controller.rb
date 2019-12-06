class PurchasesController < ApplicationController
  def index
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    begin
      charge = Payjp::Charge.create(
        amount: 300, # 決済する値段
        card: params['payjp-token'],
        currency: 'jpy'
      )
    rescue Payjp::CardError => e
      redirect_back(fallback_location: root_path, alert: 'カードが無効であるか支払額が限度を超えています')
    rescue Payjp::InvalidRequestError => e
      redirect_back(fallback_location: root_path, alert: '入力に間違いがあります')
    rescue Payjp::AuthenticationError => e
      redirect_back(fallback_location: root_path, alert: '認証に失敗しました')
    rescue Payjp::APIConnectionError => e
      redirect_back(fallback_location: root_path, alert: '通信に失敗しました')
    rescue Payjp::PayjpError => e
      redirect_back(fallback_location: root_path, alert: '決済に失敗しました。窓口に問い合わせてください。')
    rescue => e
      redirect_back(fallback_location: root_path, alert: '決済に失敗しました。窓口に問い合わせてください。')
    end
  end
end
