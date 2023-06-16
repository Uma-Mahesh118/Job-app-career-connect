class Message < ApplicationRecord
    belongs_to :conversation  
    validates :msg, presence: true            
end