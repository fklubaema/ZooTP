class AnimalsController < ApplicationController

  def index
    @zoo_animals = Animal.all
    @keeper_animals = Animal.where(kept: true)
  end

  # def trigger_all_screams
  #   @animals = Animal.all
  #   @screams = []
  #   @animals.each do |animal|
  #     @screams << animal.scream
  #   end
  # end

  def new
    @animal = Animal.new
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update_attributes(animal_params)
      @zoo_animals = Animal.all
      @keeper_animals = Animal.where(kept: true)
      render 'index'
    end
  end

  private

    def animal_params
      params.require(:animal).permit(:name, :scream, :kept)
    end

end
