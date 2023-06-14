class Post < ApplicationRecord
    belongs_to :company
    has_many :results
    has_many :applicants, through: :results
    serialize :skills, Array
    validates :name, presence: true, 
                        length: {minimum: 3, maximum:25}
    validates :description, presence: true, 
                        length: { maximum:150}
    
end