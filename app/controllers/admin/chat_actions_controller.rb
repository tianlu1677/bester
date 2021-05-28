# frozen_string_literal: true

class Admin::ChatActionsController < Admin::ApplicationController
  before_action :set_room
  before_action :set_chat_action, only: %i[show edit update destroy push_now]

  def index
    if @chat_room
      redirect_to admin_chat_room_path(@chat_room)
    else
      redirect_to admin_chat_rooms_path
    end    
  end

  def show; end

  def new
    @chat_action = @chat_room.chat_actions.new
  end

  def edit; end

  def create
    @chat_action = @chat_room.chat_actions.new(chat_action_params)

    if @chat_action.save
      redirect_to(admin_chat_room_path(@chat_room), notice: '创建成功。')
    else
      render :new
    end
  end

  def update
    if @chat_action.update(chat_action_params)
      respond_to do |format|
        format.html { redirect_to(admin_chat_room_path(@chat_room), notice: '更新成功。') }
        format.js
      end      
    else
      render :edit
    end
  end

  def destroy
    @chat_action.destroy    
    respond_to do |format|
      format.html { redirect_to admin_chat_room_path(@chat_room), notice: '删除成功.' }
      format.js
    end    
  end

  def push_now    
    @chat_action.push_message!
    respond_to do |format|
      format.html { redirect_to(admin_chat_room_path(@chat_action.chat_room), notice: '更新成功。') }
      format.js
    end
  end

  private

  def set_chat_action    
    @chat_action = ChatAction.find(params[:id])
  end

  def set_room
    @chat_room = ChatRoom.find_by(id: params[:chat_room_id])
  end

  def chat_action_params
    params.require(:chat_action).permit!
  end

  def show_attributes
    %w[id created_at updated_at]
  end
end
