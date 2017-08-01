class Client < ApplicationRecord
  validates :firstName, presence: true
end
