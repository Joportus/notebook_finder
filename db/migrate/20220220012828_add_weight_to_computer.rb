class AddWeightToComputer < ActiveRecord::Migration[7.0]
  def change
    add_column :computers, :weight, :string
  end
end
