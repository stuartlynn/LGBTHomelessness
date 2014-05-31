class HomeController < ApplicationController

  def index

  end

  def about

  end

  def who

  end

  def results
    @programs = Program.all()
  end

  def contact

  end


end
