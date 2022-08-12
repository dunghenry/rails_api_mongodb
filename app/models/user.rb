class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  field :username, type: String
  field :email, type: String
  field :password_digest, type: String
  field :type, type: Integer
  field :token, type: String
  validates :username, presence: true, :uniqueness => true
  validates :email, presence: true, :uniqueness => true
  validates :password, presence: true, :length => { :minimum => 10 }, :on => :addUser
  has_secure_password
end
