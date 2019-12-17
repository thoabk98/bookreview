class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]
  before_action :get_category
  def home
  end
  
  def get_category
    @categories = Category.all
  end
end
