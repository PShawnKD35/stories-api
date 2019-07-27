class Story < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, :text, presence: true
end
