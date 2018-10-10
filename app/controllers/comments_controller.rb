class CommentsController < ApplicationController
  def create
    if user_signed_in?
      @post = Post.find(params[:id])
      # @post = Post.where("team_id = ?", params[:team_id])
      # # @comment = @post.comments.create!(params.require(:comment).permit!)
      # @comment = Comment.new
      # @comment.body = params[:input_comment]
      # @comment.commenter = current_user.name
      # @comment.save

      @comment = Comment.new
      @comment.body = params[:input_comment]
      @comment.post_id = params[:id]

      @comment.save
      # redirect_to show_post_url(teamid: @current_user.team_id, id: @post.id)
      redirect_to show_post_path(teamid: current_user.team_id, id:@comment.post_id)
    end

  end

  def destroy
    if user_signed_in?
    #   @post = Post.find(params[:id])
    #   @comment = @post.comments.find(params[:post_id])
    #   # @comment = @post.comments
    #   if @comment.commenter != current_user.name
    #     flash.now[:alert] = '본인만 이글을 삭제할 수있습니다!'
    #     redirect_back(fallback_location: root_path)
    #   else
    #   @comment.destroy
    #   redirect_to show_url(teamid: @team_id)
    #   end

    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to show_post_path(teamid: current_user.team_id, id:@comment.post_id)
    end
  end


end
