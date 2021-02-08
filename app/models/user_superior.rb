class UserSuperior < ApplicationRecord
  belongs_to :user
  belongs_to :superior
end
