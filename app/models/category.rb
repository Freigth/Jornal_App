class Category < ApplicationRecord
    validates :name, presence:true, length:{ minimum: 2 }
    validates :user_id, presence:true

    has_many :tasks, dependent: :destroy
    belongs_to :user
end
