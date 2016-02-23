class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.integer :number_available
      t.belongs_to :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
