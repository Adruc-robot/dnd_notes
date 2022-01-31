class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.integer :campaign_id
      t.string :note_heading
      t.text :note_text

      t.timestamps
    end
  end
end
