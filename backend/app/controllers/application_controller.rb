class ApplicationController < ActionController::API
  include Knock::Authenticable
  include CanCan::ControllerAdditions
  check_authorization

  before_action :set_paper_trail_whodunnit
  before_action :set_locale

  def set_locale
    I18n.locale = user_locale || guest_locale
  end

  rescue_from CanCan::AccessDenied do |_exception|
    head :forbidden
  end

  private

  def guest_locale
    params[:locale] || request.headers['locale'] || I18n.default_locale
  end

  def user_locale
    current_user && current_user.locale
  end
end
