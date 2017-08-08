class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  private

    def validate_user
      # get the authentication token
      token = request.headers['Authorization']
      # if doesn't exist, return a 401 status
      if token
        # if exist, check if is a valide session
        session = Session.where(token: token).first
        # validate if it hasn't expired yet
        if !session
          render json: "{error: 'not a valid session'}".to_json, status: 401
        end
      else
        # if not valid return 401
        render json: "{error: 'not a valid session'}".to_json, status: 401
      end

    end
end
