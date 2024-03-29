class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by_email(params[:session][:email])  # I had inavertently typed :password here
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page
      sign_in user  # I had inadvertently typed sign_in_user and redirect_to_user before
      redirect_to user
    else
      # Create an error message and re-render the signin form.
      flash.now[:error] =  'Invalid email/password combination' 
        # the '.now' causes the flash message to disappear after the next request.
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
