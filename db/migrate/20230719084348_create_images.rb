class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :pathname
      t.integer :size
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
