class HomeController < ApplicationController
  def index
    @questions = Question.all.sort_by(&:up_votes).reverse
  end
end
