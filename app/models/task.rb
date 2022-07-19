class Task < ApplicationRecord
    validates :name, presence: true, length:{ minimum: 2 }
    validates :description, presence: true
    validates :deadline, presence: true
    validates :category_id, presence: true
    
    belongs_to :category
    delegate :user, to: :category
end
