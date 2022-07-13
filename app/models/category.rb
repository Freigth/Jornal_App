class Category < ApplicationRecord
    validates :name, presence:true, length:{ minimum: 2 }
    has_many :tasks, dependent: :destroy
end
