class OrdersController < ApplicationController

    # 重複処理のまとめ
    before_action :set_item, only: [ :index, :create]

  def index
    # Formオブジェクトのインスタンスを作成して、インスタンス変数に代入する
    @order_address = OrderAddress.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      @order_address.save
      # 保存が成功した場合の処理を追加（例: 注文完了ページへのリダイレクトなど）
      redirect_to root_path
    else
      # バリデーションエラーが発生した場合の処理を追加
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end


  def set_item
    @item = Item.find(params[:item_id])
  end

end
