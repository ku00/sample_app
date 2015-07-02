class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      @micropost.content =~ (/((?:^@|\s+@)(\S*)(?::\s+|:$))/)
      if !$2.nil? && user = User.find_by(user_name: $2)
        if reply_to_post = user.microposts.find_by(id: params[:reply_to_post_id])
          @micropost.reply_to(reply_to_post)
        end
      end
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  def reply
    @micropost = Micropost.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
