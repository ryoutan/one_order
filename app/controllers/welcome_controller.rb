class WelcomeController < ApplicationController
  def index
    @file = File.read("#{Rails.root}/README.md")
  end
end
