class Apply < ApplicationRecord
  belongs_to :member, class_name: "User"
  belongs_to :superior, class_name: "User"
  
  validates :member_id, presence: true
  validates :superior_id, presence: true
end
