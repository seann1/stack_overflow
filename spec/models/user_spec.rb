require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of :password_digest }
  it { should ensure_length_of(:password).is_at_most(25) }

  it { should have_many :questions }
  it { should have_many :answers }


end
