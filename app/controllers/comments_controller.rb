class CommentsController < ApplicationController
  before_action :session_required
  # 新增留言必須登入
  before_action :find_post, only: [:create]


  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    if @comment.save
      redirect_to @post, notice: '留言新增成功'
    else
      render 'posts/show'
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_post
    @post = Post.find(params[:post_id])
    # 如果單純給 id 他不知道要抓誰
  end
end