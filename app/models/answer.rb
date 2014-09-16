class Answer < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :question_id, :presence => true
  validates :description, :presence => true
  validates_uniqueness_of :description

  validates_length_of :description, maximum: 1000

  belongs_to :user
  belongs_to :question

  def choice
    self.update(:user_choice => true)
  end

end
