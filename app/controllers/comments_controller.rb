class CommentsController < ApplicationController
  before_action :session_required
  # 新增留言必須登入
  before_action :find_post, only: [:create]


  def create
    @comment = current_user.comments.new(comment_params)
  end


  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_post
  end
end