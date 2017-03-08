class Message < ApplicationRecord

  validates :text, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :recipient, presence: true

end
