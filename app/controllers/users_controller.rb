# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    if current_user.admin?
      @users = User.order(:id).page(params[:page])
    elsif current_user.company_admin?
      @users = User.order(:id).where(company_id: current_user.company_id).page(params[:page])
    else
      redirect_to root_path unless current_user.admin?
    end
  end

  def show
    @user = current_user
  end
end
