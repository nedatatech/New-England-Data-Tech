class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string  :name
      t.string  :job_type
      t.string  :description
      t.text    :page_body
      t.decimal :base_price
      t.decimal :hourly_rate
      t.decimal :avg_cost
      t.string  :slug

      t.timestamps
    end
    add_index :services, :slug
  end
end
