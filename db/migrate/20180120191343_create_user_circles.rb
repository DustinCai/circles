class CreateUserCircles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_circles do |t|
      t.belongs_to :user, index: true
      t.belongs_to :circle, index: true

      t.timestamps
    end
  end
end
