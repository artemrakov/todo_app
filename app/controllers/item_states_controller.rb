# Controller that handles the state of Item
class ItemStatesController < ApplicationController
  before_action :find_item, only: %i[create destroy]

  def create
    @item.complete!
  end

  def destroy
    @item.undo!
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end
end
