class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def create
    @post = current_user.posts.build(post_parms).save
    redirect_to request.env['HTTP_REFERER']
  end

  private

  def post_parms
    params.require(:post).permit(:message)
  end
end
