class CreateVariations < ActiveRecord::Migration
  def change
    create_table :spree_variations do |t|
      t.references :experiment, index: true
      t.text :data, :limit => 4294967295
      t.integer :render_count
      t.integer :success_count
      t.string :name
      t.boolean :status, :default => true
      t.integer :render_percentage

      t.timestamps
    end
  end
end
