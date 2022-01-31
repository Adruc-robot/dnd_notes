class CreateUsefulLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :useful_links do |t|
      t.integer :user_id
      t.integer :campaign_id
      t.text :name
      t.string :url

      t.timestamps
    end
  end
end
