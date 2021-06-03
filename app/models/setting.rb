# == Schema Information
#
# Table name: settings
#
#  id         :bigint           not null, primary key
#  var        :string           not null
#  value      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# RailsSettings Model
class Setting < RailsSettings::Base
  cache_prefix { "v1" }

  # Define your fields
  field :bot_token , type: :string, default: ""
  field :template_key1 , type: :json, default: ""
  field :template_key2 , type: :json, default: ""
  field :template_key3 , type: :json, default: ""
  # field :default_locale, default: "en", type: :string
  # field :confirmable_enable, default: "0", type: :boolean
  # field :admin_emails, default: "admin@rubyonrails.org", type: :array
  # field :omniauth_google_client_id, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_ID"] || ""), type: :string, readonly: true
  # field :omniauth_google_client_secret, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"] || ""), type: :string, readonly: true
end
