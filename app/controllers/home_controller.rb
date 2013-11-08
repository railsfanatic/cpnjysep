class HomeController < ApplicationController
  def index
    @media = Gram.all
  end
end
