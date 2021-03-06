class Comment < ApplicationRecord
  after_create :send_favorite_emails

  belongs_to :post
  belongs_to :user

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true

  private

 def send_favorite_emails
   post.favorites.each do |favorite|
     FavoriteMailer.new_comment(favorite.user, post, self).deliver_now
   end
 end
end
