class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	
	  @post = Post.new(post_params)
	   @post.save
	  redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		# byebug
	  @post = Post.find(params[:id])
	  @post.update(params.require("post").permit("title", "description"))
	  redirect_to post_path(@post)
	end

	def post_params
		params.permit("title", "description")
	end
end