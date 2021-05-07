class WelcomeController < ApplicationController
  def index
    @file = File.read("#{Rails.root}/README.md")
  end

  def no_food_meal
    @meal = Meal.all
    @no_food_meal = { no_food_meal: [] }
    @meal.each do |meal|
      if meal.foods.empty?
        @no_food_meal[:no_food_meal] << meal.name
      end
    end
    render json: @no_food_meal
  end
end
