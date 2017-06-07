class Contact < ApplicationRecord
    validates :user_id, presence: true
    belongs_to: user
    has_many :reaches, dependent: :destroy
end
