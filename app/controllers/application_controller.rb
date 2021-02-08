# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale
  # locale=jaとen以外はjaを返すようにした。
  def switch_locale(&action)
    locale = case params[:locale]
             when 'ja'
               'ja'
             when 'en'
               'en'
             else
               I18n.default_locale
             end
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
