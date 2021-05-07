class WelcomeController < ApplicationController
  def index
    @file = File.read("#{Rails.root}/README.md")
  end

  def no_food_meal
    @meal = Meal.includes(:foods)
    @no_food_meal = { no_food_meal: [] }
    @meal.each do |meal|
      if meal.foods.empty?
        @no_food_meal[:no_food_meal] << meal.name
      end
    end
    render json: @no_food_meal
  end

  def max_foods
    @max_foods = {}
    @meal = Meal.includes(:foods)
    food_array = []
    @meal.each do |meal|
      meal.foods.each do |food|
        food_array << food.name
      end
    end
    
    foods_name = Food.all.map do |food|
      food.name
    end

    foods_name.sort.each do |name|
      @max_foods[name] = food_array.count(name)
    end
    render json: @max_foods
  end
end
