# Base Controller for API calls.
# Contains basic security functions
class Api::BaseController < ActionController::Base
 before_filter :check_json, :check_api_key

  # Method to check for json format
  def check_json
    if request.format != :json
      render :status => 406, :json=>{
        :errors => ["Sorry the request must be in json"]
      }
      return
    end
  end

  # Method to check for api_key in env
  def check_api_key
    if request.env['HTTP_X_API_TOKEN']
      token = request.env['HTTP_X_API_TOKEN']
      check_token(token)
    else
      render :status=>401, :json=>{:errors => ["HTTP Token: Access denied."]}
    end
  end

  # Method to check provided token with configured token.
  def check_token(token)
    return unless token
    if token == Rails.application.config.api_token
      return true
    else
      render :status=>401, :json=>{:errors => ["HTTP Token: Access denied."]}
    end
  end

  # Exceptions not to be included in
  # json response
  def exceptions
    [:created_at, :updated_at]
  end

end