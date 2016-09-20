class AddKeptToAnimal < ActiveRecord::Migration
  def change
    add_column :animals, :kept, :boolean
  end
end
