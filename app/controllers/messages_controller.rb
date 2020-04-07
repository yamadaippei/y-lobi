class MessagesController < ApplicationController
  before_action :set_group
  
  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group)
      # respond_to do |format|
      #   format.json
      # end
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください'
      render :index
    end

    # respond_to do |format|
    #   format.html { redirect_to group_message_path, notice: "メッセージを送信しました "}
    #   format.json
    # end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    message = current_user.messages.find(params[:id])
    if message.update(message_params)
      redirect_to group_messages_path(@group)
    else
      render :index
    end
  end

  def destroy
    message = current_user.messages.find(params[:id])
    message.destroy
    redirect_to group_messages_path(@group)
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
