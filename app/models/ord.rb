class Ord < ApplicationRecord
    has_many :orders, dependent: :destroy
    has_many :items, through: :orders
    belongs_to :user
end
