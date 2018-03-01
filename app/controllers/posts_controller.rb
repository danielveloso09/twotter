class PostsController < ApplicationController
  # before_action :set_movie, except: %i[index new create show]
  def index
    @posts = current_user.posts
  end

  def create
    @post = current_user.posts.build(post_parms)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  private

  def post_parms
    params.require(:post).permit(:message)
  end
end
