class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.float :rating
      t.string :first_name
      t.string :last_initial
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
