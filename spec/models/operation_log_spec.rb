# == Schema Information
#
# Table name: operation_logs
#
#  id         :bigint           not null, primary key
#  user_id    :integer
#  params     :text
#  action     :string
#  controller :string
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe OperationLog, type: :model do
  describe "create success" do
    it 'success' do
      operation_log = FactoryBot.create(:operation_log)
      expect(OperationLog.count).to eq 1
    end
  end
end
