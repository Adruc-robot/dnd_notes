class Campaign < ApplicationRecord
    belongs_to :user
    has_many :notes
    has_many :useful_links
end
