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

class OperationLog < ApplicationRecord
  acts_as_paranoid
end
