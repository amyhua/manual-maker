class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :manual_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
