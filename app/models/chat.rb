class Chat < ApplicationRecord
    validates :number, presence: true
    belongs_to :application , optional: true
    has_many :messages
end
