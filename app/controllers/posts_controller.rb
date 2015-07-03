class PostsController < ApplicationController

	before_action :confirm_admin, :except => [:show, :index]
  before_action :load_posts, :only => [:index, :create]

  responders :flash
  respond_to :html, :js

	def show
		@post = Post.find(params[:id])
	end

  def index
  	#@posts = Post.order(created_at: :desc)
    @posts = Post.order(created_at: :desc).page(params[:page])
  end

	def new
		@post = Post.new
	end

	def create
    sleep 2
		@post = Post.new(post_params)
    @post.author = Player.find(session[:player_id]).first_name + " " + Player.find(session[:player_id]).last_name

    if @post.savefla
      flash.now[:success] = "Post created successfully"
    else
      flash.now[:danger] = "Post not created"
    end
	end

  def cancel

  end

  def edit

  end

  def update

  end

  def delete

  end

  def destroy

  end


  private
    def post_params
      params.require(:post).permit(:topic, :desc)
    end

    def load_posts
      @posts = Post.order(created_at: :desc)
    end
end
