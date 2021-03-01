# frozen_string_literal: true

class Companies::UsersController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @users = @company.users.order(:id).page(params[:page])
    unless @company == current_user.company
      raise ActiveRecord::RecordNotFound
    end
  end

  def show
    @user = current_user
  end
end
