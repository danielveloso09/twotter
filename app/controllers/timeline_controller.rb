class TimelineController < ApplicationController
  def index
    @posts = Post.myposts(current_user)
  end
end
