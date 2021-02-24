# frozen_string_literal: true

class Companies::UsersController < ApplicationController
  def index
    redirect_to root_path unless current_user.company_admin?
    @company = Company.find(params[:company_id])
    @users = @company.users.order(:id).page(params[:page])
  end

  def show
    @user = current_user
  end
end
