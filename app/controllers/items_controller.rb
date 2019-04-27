class ItemsController < ApplicationController

  def create
    checklist = Checklist.find(params[:checklist_id])
    item = Item.new(checklist: checklist)
    if items.save
      redirect_to ''
    else

    end
  end

  def update

  end
end

