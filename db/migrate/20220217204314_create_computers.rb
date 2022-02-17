class CreateComputers < ActiveRecord::Migration[7.0]
  def change
    create_table :computers do |t|
      t.string :name
      t.string :cpu
      t.string :ram
      t.string :storage
      t.string :screen
      t.string :integrated_gpu
      t.string :discrete_gpu
      t.string :details_url
      t.integer :apps_score
      t.integer :gaming_score
      t.integer :movility_score
      t.integer :price

      t.timestamps
    end
  end
end
