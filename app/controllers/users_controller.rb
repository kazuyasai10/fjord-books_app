# frozen_string_literal: true

class UsersController < ApplicationController
  def index
      redirect_to root_path unless current_user.admin?
      @users = User.order(:id).page(params[:page]).per(3)
  end

  def show
    @user = current_user
  end
end
