class Message < ApplicationRecord
    include Searchable
    validates :message, presence: true
    validates :number, presence: true
    belongs_to :chat , optional: true
end
