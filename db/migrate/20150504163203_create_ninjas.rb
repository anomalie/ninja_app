class CreateNinjas < ActiveRecord::Migration
  def change
    create_table :ninjas do |t|
      t.string :name
      t.string :secret_name
      t.string :power_level

      t.timestamps null: false
    end
  end
end
