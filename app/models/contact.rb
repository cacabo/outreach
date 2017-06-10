class Contact < ApplicationRecord
    validates :user_id, presence: true
    validates :name, presence: true
    validates :company, presence: true
    validates :role, presence: true
    
    belongs_to :user
    has_many :reaches, dependent: :destroy
end
