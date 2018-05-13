class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_teamid


  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where("team_id = ?", params[:team_id])
    @posts = Post.order(created_at: :desc)
    # @posts = @posts.order('created_at DESC').paginate(:page => params[:page])
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new(params[:team_id])
  end

  # GET /posts/1/edit
  def edit
    authorize_action_for @post
  end

  def home
  end


  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to show_post_path(@current_user.team_id,id: @post.id), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize_action_for @post

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to show_post_url(teamid: @current_user.team_id, id: @post.id), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authorize_action_for @post

    @post.destroy
    respond_to do |format|
      format.html { redirect_to show_url(@teamid), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
    # redirect_to show_path(@teamid)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    def set_teamid
      @teamid = params[:teamid]
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      # params.require(:post).permit(:name, :title, :content)
      params.fetch(:post).permit(:content,:title,:attachment,:user_id)
    end

end
