class Guess < ActiveRecord::Base
  # Remember to create a migration!
  #
  belongs_to :card
  belongs_to :round
  

  def correct?
    self.is_correct > 0
  end
  
  def answer(user_input)
    if user_input == self.card.answer
      self.is_correct = 1
    else
      self.is_correct = 0
    end
    self.save
  end
  
end



# if @guess.answer(params[:guess])
#   redirect /next_card
# else
#   @errors = @guess.errors
#   render :learn
# end
