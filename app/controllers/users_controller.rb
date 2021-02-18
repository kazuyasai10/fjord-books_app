# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    redirect_to root_path unless current_user.company_admin?
    @users = User.order(:id).where(company_id: current_user.company_id).page(params[:page])
  end

  def show
    @user = current_user
  end
end
