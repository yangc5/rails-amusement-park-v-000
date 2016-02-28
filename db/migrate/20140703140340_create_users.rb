class CreateUsers < ActiveRecord::Migration
  # Write your migrations here
  def change
    create_table :users do |t|
      t.string :name
      t.integer :happiness
      t.integer :nausea
      t.integer :height
      t.integer :tickets
      t.boolean :admin, default: false
    end
  end
end
