class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :name
      t.text :description
      t.text :readme

      t.timestamps null: false
    end
  end
end
