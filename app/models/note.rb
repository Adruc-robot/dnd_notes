class Note < ApplicationRecord
    has_rich_text :note_text
    belongs_to :user
    belongs_to :campaign
end
