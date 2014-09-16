class Vote < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: :answer_id
  validates_uniqueness_of :answer_id, scope: :user_id
  validates_presence_of :user_id
  validates_presence_of :answer_id

  belongs_to :user
  belongs_to :answer
end
