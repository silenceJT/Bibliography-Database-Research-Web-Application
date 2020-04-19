class StaticPagesController < ApplicationController
  #skip_before_action :authorized, only: [:help, :about, :contact]
  
  def home
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def search
  end
end
