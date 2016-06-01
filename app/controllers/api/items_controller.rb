class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    item = Item.new(item_params)
    item.list_id = params[:list_id]
    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(list_params)
      render json: item
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:description)
  end

end
