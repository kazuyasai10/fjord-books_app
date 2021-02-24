# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  def index
    redirect_to root_path unless current_user.admin?
    @users = User.order(:id).page(params[:page])
  end

  def edit; end
end
