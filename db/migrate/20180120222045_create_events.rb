class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :type
      t.datetime :time
      t.belongs_to :circle, index: true

      t.timestamps
    end
  end

end
