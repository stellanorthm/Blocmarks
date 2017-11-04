class LikesController < ApplicationController
  def index
  end

  def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     like = current_user.likes.build(bookmark: @bookmark)

     if like.save
       flash[:notice] = "You liked this bookmark!"
       redirect_to @topic
     else
       flash[:alert] = "There was an error liking this bookmark. Please try again."
       redirect_to @topic
     end
   end

   def destroy
     @bookmark = Bookmark.find(params[:bookmark_id])
     @topic = @bookmark.topic
     like = current_user.likes.find(params[:id])

     if like.destroy
       flash[:notice] = "You unliked this bookmark."
       redirect_to @bookmark
     else
       flash[:alert] = "There was an error unliking this bookmark. Please try again."
       redirect_to @bookmark
     end
   end

end
