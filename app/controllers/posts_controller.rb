class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.where('id == 1'||'id % 5 == 0' ).update_all(title: "Spam")

    # @posts.each_with_index {|index,post|
    #   if index % 5 ==0
    #     post.title = "spam"
    #   end}
  end

  def show
  end

  def new
  end

  def edit
  end
end
