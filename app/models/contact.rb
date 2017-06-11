class Contact < ApplicationRecord
    validates :user_id, presence: true
    validates :name, presence: true { message: "Name cannot be blank" }
    validates :company, presence: true, message: "Company connot be blank"
    validates :role, presence: true, message: "Role cannot be blank"

    belongs_to :user
    has_many :reaches, dependent: :destroy
end
