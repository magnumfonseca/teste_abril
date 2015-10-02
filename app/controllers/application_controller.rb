class ApplicationController < ActionController::Base
#  protect_from_forgery with: :exception
  @@tasks =[]
  def render_bad_request
    payload = {
      error: "mandatory parameter Not Set",
      status: 400
    }
    render :json => payload, :status => :bad_request
  end
end
