class Note < ApplicationRecord
    #has_rich_text :content
    has_rich_text :content
    belongs_to :user
    belongs_to :campaign

    validates :note_heading, presence: true
    validates :content, presence: true
end
