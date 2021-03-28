class Apply < ApplicationRecord
  belongs_to :member, class_name: "User"
  belongs_to :superior, class_name: "User"
  
end
