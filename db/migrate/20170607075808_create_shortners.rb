class CreateShortners < ActiveRecord::Migration[5.0]
  def change
    create_table :shortners do |t|
      t.string :shortened_url
      t.text :actual_url
      t.integer :http_status

      t.timestamps
    end
  end
end
