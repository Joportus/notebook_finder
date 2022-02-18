class AddImgurlToComputer < ActiveRecord::Migration[7.0]
  def change
    add_column :computers, :image_url, :string
  end
end
