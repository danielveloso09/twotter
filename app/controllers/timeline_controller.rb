class TimelineController < ApplicationController
  def index
    @posts = Post.timeline_posts(current_user)
  end
end
