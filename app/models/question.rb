class Question < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
  validates_uniqueness_of :title

  validates_length_of :title, maximum: 400
  validates_length_of :description, maximum: 1200

  belongs_to :user
  has_many :answers, dependent: :destroy

end
