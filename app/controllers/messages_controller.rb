class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def message    
    # RestClient.post('https://webhook.site/ae958f7d-dfa5-4fe3-acbf-ed4188d1804f', params.to_json)
    chat_room_params = params[:data]

    ChatRoom.parse(chat_room_params)
    ChatMessage.parse(params[:message][:data])
    ChatContact.parse(params[:message][:data])
    render json: { data: params[:data] }
  end
end

# https://webhook.site/#!/ae958f7d-dfa5-4fe3-acbf-ed4188d1804f/fb0c18bc-8044-4b54-a74e-77a99bdaeba8/1