class Item < ApplicationRecord
	has_many :carters, dependent: :nullify
	has_many :carts, through: :carters
	has_many :orders, dependent: :nullify
	has_many :ords, through: :orders

	validates :title, length: { minimum: 3,
    too_short: "%{count} charactères minimum" 
  }

	validates :description, presence: {
		message: "la description est obligatoire"
	}

	validates :price, presence: {
		message: "le prix est obligatoire"
	}

	validates :price, numericality: {
		message: "le prix doit être un numérique"
	}

	validates :image_url, presence: {
		message: "l'url de l'image est obligatoire"
	}

	validates :thumb_url, presence: {
		message: "l'url de l'aperçu est obligatoire"
	}

	validates :image_url, uniqueness: {
		message: "cette image est déjà dans la base"
	}

	validates :thumb_url, uniqueness: {
		message: "cette image est déjà dans la base"
	}

end
