class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :title, presence: true
  validates :body,  presence: true
end
