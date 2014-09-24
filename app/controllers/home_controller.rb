class HomeController < ApplicationController
  layout "application_mobile", :only => [ :mobile ]
  def index

  end

  def about

  end

  def who

  end

  def volunteer

  end

  def calendar
  end

  def results
    @programs = Program.all()
  end

  def contact

  end

  def mobile
    render 'mobile_index'
  end

  def org_list
    
  end 

  def wish_lists

  end

  def donate_money

  end

  def give_help

  end

end
