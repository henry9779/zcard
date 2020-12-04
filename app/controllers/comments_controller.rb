class CommentsController < ApplicationController
  before_action :session_required
  # 新增留言必須登入
  before_action :find_post, only: [:create]


  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    if @comment.save
      redirect_to @post
    else
      render 'posts/show'
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    # 從使用者角度找comments, 然後從那些comments找到那筆資料
    comment.destroy
    #model 假刪除定義為destroy

    #comment.update(delete_at: Time.now)
    # 利用寫入時間更新欄位，然後到post_controller過濾掉
    redirect_to comment.post, notice: '留言已刪除'
    # 回到commnet所屬文章
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