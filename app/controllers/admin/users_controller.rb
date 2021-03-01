# frozen_string_literal: true

class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.order(:id).page(params[:page])
  end
end
