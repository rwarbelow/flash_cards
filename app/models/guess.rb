class Guess < ActiveRecord::Base
  # Remember to create a migration!
  def correct?
    self.is_correct > 0
  end


  
end
