class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name, null: false
      t.binary :data, null: false

      t.timestamps
    end

    add_index :images, :name, unique: true
  end
end
