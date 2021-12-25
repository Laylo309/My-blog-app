# rubocop disable: Lint/UselessAssignment
class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  respond_to :json

  def new
    user = User.new(user_params)
  end

  def create
    user = User.new(user_params)
    user.posts_counter = 0

    if user.save
      render json: { status: 'SUCCESS', message: 'Created new user account', data: user }, status: :ok
    else
      render json: { status: 'ERROR',
                     message: 'Could not create new user account',
                     data: user.errors },
             status: :unprocessable_entity

    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :posts_counter, :role)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name posts_counter email password role])
  end
end
# rubocop enable: Lint/UselessAssignment