# frozen_string_literal: true

class Admin::ChatRoomsController < Admin::ApplicationController
  before_action :set_chat_room, only: %i[show edit update destroy]

  def index
    @q = ChatRoom.all.ransack(params[:q])
    @chat_rooms = @q.result.order('chat_rooms.id desc')
    @pagy, @chat_rooms = pagy(@chat_rooms, items: params[:per_page] || 20, page: params[:page])
  end

  def show
    @chat_actions = @chat_room.chat_actions
  end

  def new
    @chat_room = ChatRoom.new
  end

  def edit; end

  def create
    @chat_room = ChatRoom.new(chat_room_params)

    if @chat_room.save
      redirect_to(admin_chat_rooms_path, notice: '创建成功。')
    else
      render :new
    end
  end

  def update
    if @chat_room.update(chat_room_params)
      respond_to do |format|
        format.html { redirect_to(admin_chat_rooms_path, notice: '更新成功。') }
        format.js
      end      
    else
      render :edit
    end
  end

  def destroy
    @chat_room.destroy    
    respond_to do |format|
      format.html { redirect_to admin_chat_rooms_path, notice: '删除成功.' }
      format.js
    end    
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  end

  def chat_room_params
    params.require(:chat_room).permit!
  end

  def show_attributes
    %w[id created_at updated_at]
  end
end
