class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "後ほどお試しください" }

  def new
  end

  def create
    if user = User.authenticate_by(params.permit(:email_address, :password))
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_session_path, alert: "他のemailまたはパスワードを試してください"
    end
  end

  def destroy
    terminate_session
    #redirect_to new_session_path
    redirect_to kadaikanris_path
  end
end
