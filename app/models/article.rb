class Article < ApplicationRecord 
  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, presence: true, length: {minimum: 5, maximum: 120}
end