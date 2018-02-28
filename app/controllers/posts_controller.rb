class PostsController < ApplicationController
  # before_action :set_post, except: %i[index new create show]

  def index
    @posts = Post.all

    # respond_to do |format|
    #   format.html
    #   format.json do
    #     render json: @posts.to_json(except: [:updated_at])
    #   end
    #   format.xml { render xml: @posts }
    # end
  end

  # def show
  #   @post = Post.includes(:reviews).find(params[:id])
  # end

  # def new
  #   @post = Post.new
  # end

  # def create
  #   @post = Post.new(post_params)

  #   if @post.save
  #     redirect_to @post
  #   else
  #     render :new
  #   end
  # end

  # def update
  #   @post.update(post_params)

  #   if @post.update(post_params)
  #     format.html { redirect_to @post, notice: 'Actor was successfully updated.' }
  #     format.json { render :show, status: :ok, location: @post }
  #   else
  #     format.html { render :edit }
  #     format.json { render json: @post.errors, status: :unprocessable_entity }
  #   end
  # end

  # def destroy
  #   @post.destroy
  #   redirect_to :posts
  # end

  # private

  # def post_params
  #   params.require(:post).permit(:message, :user_id)
  # end

  # def set_post
  #   @post = Post.find(params[:id])
  # end
end
