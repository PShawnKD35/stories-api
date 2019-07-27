class Comment < ApplicationRecord
  belongs_to :story
  validates :name, :content, :story, presence: true
end
