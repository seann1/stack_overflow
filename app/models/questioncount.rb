class Questioncount < ActiveRecord::Base
  def initialize(id, aCount)
    @id = id
    @aCount = aCount
  end
end
