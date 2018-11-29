class Cart < ApplicationRecord
    has_many :carters, dependent: :destroy
    has_many :items, through: :carters
    belongs_to :user
end
