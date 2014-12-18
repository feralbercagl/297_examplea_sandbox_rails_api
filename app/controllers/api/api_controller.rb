class Api::ApiController < ApplicationController
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :render_error
    rescue_from Mongoid::Errors::DocumentNotFound, with: :render_not_found
    rescue_from ActionController::RoutingError, with: :render_no_route_found
  end

  def raise_not_found!
    raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
  end

  # render 500 error
  def render_error(e)
    Rails.logger.error("#{e.class.name}: #{e.message} - #{e.backtrace}")
    respond_to do |f|
      f.json{ render json: "Internal Server Error", status: 500 }
    end
  end

  # render 404 error
  def render_not_found(e)
    respond_to do |f|
      f.json{ render json: "Not found: #{params[:id]}", status: 404 }
    end
  end

  # render 404 error due to no route matching.
  def render_no_route_found(e)
    respond_to do |f|
      f.json{ render json: "Invalid route: #{params[:unmatched_route]}", status: 404 }
    end
  end
end
