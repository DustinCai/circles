class CreateCircles < ActiveRecord::Migration[5.0]
  def change
    create_table :circles do |t|
      t.string :name
      t.integer :subject
      t.integer :status
      t.integer :size

      t.timestamps
    end
  end
end
