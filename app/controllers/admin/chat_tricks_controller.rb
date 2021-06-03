# frozen_string_literal: true

class Admin::ChatTricksController < Admin::ApplicationController
  before_action :set_chat_trick, only: %i[show edit update destroy delete_file]

  def index
    @q = ChatTrick.all.ransack(params[:q])
    @chat_tricks = @q.result.order('chat_tricks.id desc')
    @pagy, @chat_tricks = pagy(@chat_tricks, items: params[:per_page] || 20, page: params[:page])
  end

  def show
    @chat_actions = @chat_trick.chat_actions.order('chat_actions.id asc')
  end

  def new
    @chat_trick = ChatTrick.new
  end

  def edit; end

  def create
    @chat_trick = ChatTrick.new(chat_trick_params)

    if @chat_trick.save
      redirect_to(admin_chat_tricks_path, notice: '创建成功。')
    else
      render :new
    end
  end

  def update
    if @chat_trick.update(chat_trick_params)
      respond_to do |format|
        format.html { redirect_to(admin_chat_tricks_path, notice: '更新成功。') }
        format.js
      end      
    else
      render :edit
    end
  end

  def destroy
    @chat_trick.destroy    
    respond_to do |format|
      format.html { redirect_to admin_chat_tricks_path, notice: '删除成功.' }
      format.js
    end    
  end

  def delete_file
    @chat_trick.file.purge
    respond_to do |format|
      format.html { }
      format.js
    end 
  end


  private

  def set_chat_trick
    @chat_trick = ChatTrick.find(params[:id])
  end

  def chat_trick_params
    params.require(:chat_trick).permit!
  end

  def show_attributes
    %w[id created_at updated_at]
  end
end
