class PostsController < ApplicationController

	before_action :confirm_admin, :except => [:show, :index]
  before_action :load_posts, :only => [:index, :create]

	def show
		@post = Post.find(params[:id])
	end

  def index
  	@posts = Post.order(created_at: :desc)
  end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
    @post.author = Player.find(session[:player_id]).first_name + " " + Player.find(session[:player_id]).last_name

    if @post.save
      flash[:success] = "Post created successfully"
    else
      flash[:danger] = "Post not created"
    end
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
