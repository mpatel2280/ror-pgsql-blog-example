# app/controllers/posts_controller.rb
class PostsController < ApplicationController
    include Loggable
    include Trackable

    after_action :log_action, only: [:create, :update, :destroy]
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    # cache_sweeper :post_sweeper, only: [:create, :update, :destroy]
  
    helper :my_custom

    # GET /posts
    def index
      @posts = Post.all
    end
  
    # GET /posts/1
    def show
        # @post = Post.find(params[:id])
        # HelloGem.hello_from_gem(@post)
        @comment = @post.comments.build
    end
  
    # GET /posts/new
    def new
      @post = Post.new
    end
  
    # GET /posts/1/edit
    def edit
      @comment = @post.comments.build
    end
  
    # POST /posts
    def create
      @post = Post.new(post_params)
  
      if @post.save
        Resque.enqueue(PostCreatedJob, @post.id)
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        log("Post updated")
        track_change
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /posts/1
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def post_params
        params.require(:post).permit(:title, :content)
      end

    private 
      #After Action Filter
      def log_action
        Rails.logger.info "============Post action completed: #{action_name}"
      end 
  end
  