class ChatTemplate < ApplicationRecord
  store_accessor :payload, :trick_groups

  # after_initialize :set_defaults

  # has_many :trick_groups
  # accepts_nested_attributes_for :trick_groups, reject_if: :all_blank, allow_destroy: true

  def trick_groups
    (read_attribute(:trick_groups) || []).map {|v| TrickGroup.new(v) }
  end


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

  class TrickGroup
    attr_accessor :title, :trick_list

    def initialize(hash)
      @title = hash['title']
      @trick_list = hash['trick_list']
    end
  end

end
