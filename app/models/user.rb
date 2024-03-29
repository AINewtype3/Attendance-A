class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
  
  has_many :members, class_name: "Apply", foreign_key: "member_id"
  has_many :member_users, through: :members, source: :superior
  has_many :superiors, class_name: "Apply", foreign_key: "superior_id"
  has_many :superior_users, through: :superiors, source: :member
  
  attr_accessor :remember_token
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  
  validates :affiliation, length: { in: 2..30 }, allow_blank: true
  validates :basic_work_time, presence: true
  validates :designated_work_start_time, presence: true
  validates :designated_work_end_time, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  def User.digest(string)
    cost = 
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create(string, cost: cost)
  end
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def self.search(search)
    if search
      User.where(['name LIKE ?', "%#{search}%"])
    else
      User.all
    end
  end
  
  def self.import(file)
    CSV.foreach(file.path, encoding: "Shift_JIS:UTF-8", headers: true) do |row|
      user = find_by(id: row["id"]) || new
      user.attributes = row.to_hash.slice(*updatable_attributes)
      user.save!
    end
  end
  
  def self.updatable_attributes
    ['id', 'name', 'email', 'affiliation', 'employee_number', 'uid', 'basic_work_time', 
    'designated_work_start_time', 'designated_work_end_time', 'superior','admin', 'password']
  end
  
  scope :superior_users, -> { where(superior: true) }
end
