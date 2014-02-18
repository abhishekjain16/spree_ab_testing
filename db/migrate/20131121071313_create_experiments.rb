class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :spree_experiments do |t|
      t.string :name
      t.string :selector
      t.string :path
      t.string :relative_path
      t.integer :total_count
      t.string :success_selector
      t.string :success_method

      t.timestamps
    end
  end
end
