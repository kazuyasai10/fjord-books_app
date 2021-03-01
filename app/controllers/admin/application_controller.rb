# frozen_string_literal: true

class Admin::ApplicationController < ApplicationController
  before_action :requrie_admin

  private

  def requrie_admin
    redirect_to root_path unless current_user.admin?
  end
end
