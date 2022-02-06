class UpdateNoteAdd < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :audience, :string
    add_column :notes, :category, :string
  end
end
