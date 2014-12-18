class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery

  ###
  ## Authentication
  #

  def current_user

    nil

  end

  ###
  ## Authorization
  #

  def current_user_role

    "Unauthenticated Default"

  end

  def reject_as_unauthorized
    reject_as :unauthorized
  end

  def reject_as_forbidden
    reject_as :forbidden
  end

  protected
  def layout_by_resource
    if devise_controller?
      "admin"
    else
      "application"
    end
  end

  private
  def reject_as(response_code)
    response.header['WWW-Authenticate'] = "Restricted"
    render nothing: true, status: response_code
  end
end
