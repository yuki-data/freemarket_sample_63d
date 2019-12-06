class PurchasesController < ApplicationController
  def index
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: 300, # 決済する値段
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end
end
