module UsersHelper
  def get_img(user)
    user.photo.present? ? user.photo: 'https://eu.ui-avatars.com/api/?name=#{user.name}'
  end
end
