# frozen_string_literal: true

class Companies::UsersController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @users = @company.users.order(:id).page(params[:page])
    raise ActiveRecord::RecordNotFound unless @company == current_user.company
  end

  def show
    @user = current_user
  end
end
