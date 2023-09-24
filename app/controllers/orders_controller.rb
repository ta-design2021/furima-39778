class OrdersController < ApplicationController
    before_action :authenticate_user!
    # 重複処理のまとめ
    before_action :set_item, only: [ :index, :create]

  def index
    # RailsからJavaScriptへ公開鍵を渡す記述
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    # Formオブジェクトのインスタンスを作成して、インスタンス変数に代入する
    @order_address = OrderAddress.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      pay_item
      @order_address.save
      # 保存が成功した場合の処理を追加（例: 注文完了ページへのリダイレクトなど）
      redirect_to root_path
    else
      # gonを使用するための記述
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      # バリデーションエラーが発生した場合の処理を追加
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    # 決済処理を記述
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end


  def set_item
    @item = Item.find(params[:item_id])
  end

end
