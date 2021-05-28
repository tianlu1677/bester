# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  email              :string           not null
#  encrypted_password :string(128)      not null
#  confirmation_token :string(128)
#  remember_token     :string(128)      not null
#  is_admin           :boolean          default(FALSE)
#

class User < ApplicationRecord
  include Clearance::User

  def is_admin?
    is_admin
  end
end
