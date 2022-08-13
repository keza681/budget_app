class Category < ApplicationRecord
    belongs_to :user
    has_many :transactions
  
    validates :user_id, presence: true
end
