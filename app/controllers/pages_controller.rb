class PagesController < ApplicationController
  def home
    @users = User.find(1)
  end
end
