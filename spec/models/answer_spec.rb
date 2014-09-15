require 'rails_helper'

describe Answer do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :question_id }
  it { should validate_presence_of :description }

  it { should validate_uniqueness_of(:description) }
  it { should ensure_length_of(:description).is_at_most(1000) }

  it { should belong_to :user }
  it { should belong_to :question }

end
