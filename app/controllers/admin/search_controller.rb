# frozen_string_literal: true

class Admin::UsersController < Admin::ApplicationController
  
  def chat_contacts
    @q = params[:q]
    @items = if @q.to_i > 0
                  ChatContact.ransack(id_in: @q.to_i).result.limit(10)
                else
                  ChatContact.ransack(contact_name_cont: params[:q]).result.limit(10)
                end
    render json: @items.map { |item| { id: item.id, text: "#{item.id}-#{item.contact_name}" } }.to_json
  end

end