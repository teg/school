class WelcomeController < ApplicationController
  def index
    @slots = TimeSlot.upcoming
  end

end
