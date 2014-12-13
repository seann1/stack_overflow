class User < ActiveRecord::Base

  validates :email, :presence => true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, on: :create }
  validates_uniqueness_of :email

  validates :password_digest, presence: true
  validates_length_of :password, maximum: 25
  validates :username, presence: true

  has_secure_password

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :votes

  has_attached_file :avatar, storage: :s3, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://sean-stack.s3.amazonaws.com/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
