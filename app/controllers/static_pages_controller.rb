class StaticPagesController < ApplicationController
  def about
    @message = "This is the About page."
    binding.pry
  end

end
