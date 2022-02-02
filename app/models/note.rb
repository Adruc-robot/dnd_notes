class Note < ApplicationRecord
    #has_rich_text :content
    has_rich_text :content
    belongs_to :user
    belongs_to :campaign
end
