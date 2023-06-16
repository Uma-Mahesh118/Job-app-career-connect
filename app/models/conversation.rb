class Conversation < ApplicationRecord
    belongs_to :company
    belongs_to :applicant
    has_many :messages , dependent: :destroy                       
end