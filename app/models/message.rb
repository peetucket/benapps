class Message < ApplicationRecord

  validates :text, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :recipient, presence: true

  def encrypted_message
    CodeMatch.encrypt(text)
  end

end
