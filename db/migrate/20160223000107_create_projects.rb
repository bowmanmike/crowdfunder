class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :end_date
      t.integer :funding_goal
      t.text :description
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
