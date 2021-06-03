class ChatTemplate < ApplicationRecord
  store_accessor :payload, :trick_groups

  after_initialize :set_defaults


  def set_defaults
    self.trick_groups = [
      {
        title: '第一天',
        trick_ids: [1,2,3]
      },
      {
        title: '第二天',
        trick_ids: [1,2,3]
      },
      {
        title: '第三天',
        trick_ids: [1,2,3]
      },
      {
        title: '第四天',
        trick_ids: [1,2,3]
      },
    ]
  end

  
  def add

  end

  def remove

  end
end
