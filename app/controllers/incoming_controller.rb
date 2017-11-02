class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    @user =  User.find_by(email: params[:sender])
    @topic = Topic.find_by(title: params[:subject])
    @url = params["body-plain"]

    if @user.nil?
      @user = User.create(email: params[:sender], password: 'helloworld1')
    end

    if @topic.nil?
      @topic = Topic.create(title: params[:subject], user_id: @user)
    end

    @bookmark = @topic.bookmarks.create(url: @url)
    # You put the message-splitting and business
    # magic here.

    # Assuming all went well.
    head 200
  end

end
