class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.integer :budget
      t.string :use_case

      t.timestamps
    end
  end
end
