class Campaign < ApplicationRecord
    belongs_to :user
    has_many :notes, dependent: :destroy
    has_many :useful_links, dependent: :destroy
end
