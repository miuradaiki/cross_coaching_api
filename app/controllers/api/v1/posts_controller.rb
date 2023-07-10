class Api::V1::PostsController < Api::V1::BaseController
  def index
  end

  def show
  end

  def edit
  end

  def create
    post_params = params.require(:post).permit(:title, :body) # 送信されたデータを取得
    @post = Post.new(post_params) # データベースに新しい投稿を作成
    if @post.save
      head :created # レスポンスとしてHTTPステータスコード201を返す
    else
      render json: @post.errors, status: :unprocessable_entity # エラーが発生した場合はエラー情報をレスポンスとして返す
    end
  end

  def update
  end

  def destroy
  end
end
