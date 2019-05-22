class Users::ChecklistTemplatesController < ApplicationController
  def index
    @checklist_templates = user.checklist_templates
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end
end
