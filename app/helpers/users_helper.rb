module UsersHelper
  def no_post_exist?(user)
    user.posts.empty?
  end
end
