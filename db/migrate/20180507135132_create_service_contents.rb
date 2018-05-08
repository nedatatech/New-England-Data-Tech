class CreateServiceContents < ActiveRecord::Migration[5.0]
  def change
    create_table :service_contents do |t|
      t.references :service, foreign_key: true
      t.text :text1
      t.text :text2
      t.text :text3

      t.timestamps
    end
  end
end
