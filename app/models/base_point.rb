class BasePoint < ApplicationRecord
  validates :base_point_number, presence: true
  validates :base_point_name, presence: true
  validates :attendance_type, presence: true
end
