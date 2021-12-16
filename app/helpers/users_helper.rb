module UsersHelper
  def get_img(user)
  "https://eu.ui-avatars.com/api/?name=#{user.name}"
  end
end
