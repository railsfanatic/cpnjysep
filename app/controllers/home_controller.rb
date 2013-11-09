class HomeController < ApplicationController
  def index
    @media = Gram.all
  end
  
  def about
  end
end
