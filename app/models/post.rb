class Post < ApplicationRecord
    belongs_to :company
    serialize :skills, Array
    validates :name, presence: true, 
                        uniqueness:{case_sensitive: false}, 
                        length: {minimum: 3, maximum:25}
    validates :description, presence: true, 
                        length: { maximum:150}
    
end