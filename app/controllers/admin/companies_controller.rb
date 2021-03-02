# frozen_string_literal: true

class Admin::CompaniesController < Admin::ApplicationController
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @companies = Company.all
  end

  def show; end

  def new
    @company = Company.new
  end

  def edit; end

  def create
    @company = Company.new(company_params)
      if @company.save
        redirect_to admin_company_path(@company), notice: t('controllers.common.notice_create', name: Company.model_name.human)
      else
        render :new
      end
  end

  def update
      if @company.update(company_params)
        redirect_to admin_company_path(@company), notice: t('controllers.common.notice_update', name: Company.model_name.human)
      else
        render :edit
      end
  end

  def destroy
    @company.destroy
      redirect_to admin_companies_url, notice: t('controllers.common.notice_destroy', name: Company.model_name.human)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(:name)
  end
end
