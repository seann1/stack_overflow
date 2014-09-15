require 'rails_helper'

describe Question do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }

  it { should validate_uniqueness_of(:title) }

  it { should ensure_length_of(:title).is_at_most(400) }
  it { should ensure_length_of(:description).is_at_most(1200) }

  it { should belong_to :user }
  it { should have_many :answers }

end
