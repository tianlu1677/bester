# == Schema Information
#
# Table name: chat_contacts
#
#  id           :bigint           not null, primary key
#  contact_uid  :string
#  contact_name :string
#  avatar_url   :string
#  contact_type :string
#  alias_name   :string
#  marker       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe ChatContact, type: :model do
  describe "create" do

    it "create success" do
      FactoryBot.create(:chat_contact)
    end
  end
end
