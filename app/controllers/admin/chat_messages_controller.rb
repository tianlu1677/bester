# frozen_string_literal: true

class Admin::ChatMessagesController < Admin::ApplicationController
  before_action :set_chat_message, only: %i[show edit update destroy]

  def index
    @q = ChatMessage.all.ransack(params[:q])
    @chat_messages = @q.result.order('chat_messages.id desc')
    @pagy, @chat_messages = pagy(@chat_messages, items: params[:per_page] || 20, page: params[:page])
  end

  def show; end

  def new
    @chat_message = ChatMessage.new
  end

  def edit; end

  def create
    @chat_message = ChatMessage.new(chat_message_params)

    if @chat_message.save
      redirect_to(admin_chat_messages_path, notice: '创建成功。')
    else
      render :new
    end
  end

  def update
    if @chat_message.update(chat_message_params)
      respond_to do |format|
        format.html { redirect_to(admin_chat_messages_path, notice: '更新成功。') }
        format.js
      end      
    else
      render :edit
    end
  end

  def destroy
    @chat_message.destroy    
    respond_to do |format|
      format.html { redirect_to admin_chat_messages_path, notice: '删除成功.' }
      format.js
    end    
  end

  private

  def set_chat_message
    @chat_message = ChatMessage.find(params[:id])
  end

  def chat_message_params
    params.require(:chat_message).permit!
  end

  def show_attributes
    %w[id created_at updated_at]
  end
end
