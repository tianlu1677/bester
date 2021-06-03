# frozen_string_literal: true

class Admin::ChatTemplatesController < Admin::ApplicationController
  before_action :set_chat_template, only: %i[show edit update destroy]

  def index
    @q = ChatTemplate.all.ransack(params[:q])
    @chat_templates = @q.result.order('chat_templates.id desc')
    @pagy, @chat_templates = pagy(@chat_templates, items: params[:per_page] || 20, page: params[:page])
  end

  def show
    @chat_actions = @chat_template.chat_actions.order('chat_actions.id asc')
  end

  def new
    @chat_template = ChatTemplate.new
  end

  def edit; end

  def create
    @chat_template = ChatTemplate.new(chat_template_params)

    if @chat_template.save
      redirect_to(admin_chat_templates_path, notice: '创建成功。')
    else
      render :new
    end
  end

  def update
    if @chat_template.update(chat_template_params)
      respond_to do |format|
        format.html { redirect_to(edit_admin_chat_template_path(@chat_template), notice: '更新成功。') }
        format.js
      end      
    else
      render :edit
    end
  end

  def destroy
    @chat_template.destroy    
    respond_to do |format|
      format.html { redirect_to admin_chat_templates_path, notice: '删除成功.' }
      format.js
    end    
  end

  private

  def set_chat_template
    @chat_template = ChatTemplate.find(params[:id])
  end

  def chat_template_params
    params.require(:chat_template).permit!
  end

  def show_attributes
    %w[id created_at updated_at]
  end
end
