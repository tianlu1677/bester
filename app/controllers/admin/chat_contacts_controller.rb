# frozen_string_literal: true

class Admin::ChatContactsController < Admin::ApplicationController
  before_action :set_chat_contact, only: %i[show edit update destroy]

  def index
    @q = ChatContact.all.ransack(params[:q])
    @chat_contacts = @q.result.order('chat_contacts.id desc')
    @pagy, @chat_contacts = pagy(@chat_contacts, items: params[:per_page] || 20, page: params[:page])
  end

  def show; end

  def new
    @chat_contact = ChatContact.new
  end

  def edit; end

  def create
    @chat_contact = ChatContact.new(chat_contact_params)

    if @chat_contact.save
      redirect_to(admin_chat_contacts_path, notice: '创建成功。')
    else
      render :new
    end
  end

  def update
    if @chat_contact.update(chat_contact_params)
      respond_to do |format|
        format.html { redirect_to(admin_chat_contacts_path, notice: '更新成功。') }
        format.js
      end      
    else
      render :edit
    end
  end

  def destroy
    @chat_contact.destroy    
    respond_to do |format|
      format.html { redirect_to admin_chat_contacts_path, notice: '删除成功.' }
      format.js
    end    
  end

  private

  def set_chat_contact
    @chat_contact = ChatContact.find(params[:id])
  end

  def chat_contact_params
    params.require(:chat_contact).permit!
  end

  def show_attributes
    %w[id created_at updated_at]
  end
end
