class SessionsController < ApplicationController
  require 'digest/md5'

  # POST /sessions
  # POST /sessions.json
  def create
    # check if user exists in the User database
    username = session_params[:username]
    password = session_params[:password]
    password = Digest::MD5.hexdigest(password)
    user = User.where(username: username , password: password).first
    if user
      # generate token // Para Jonathan: Generar Token
      token = Digest::MD5.hexdigest(username)
      # create the session
      session = Session.new(token: token)
      session.user = user
      if session.save
        render json: "token: #{token}".to_json, status: :created
      end
    end
  end


  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.permit(:username, :password)
    end
end
