class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save :downcase_email
  has_secure_password
  validates :email, presence: true,
    length: {maximum: Settings.user_setting.email_maximum_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :name, presence: true,
    length: {maximum: Settings.user_setting.name_maximum_length}
  validates :password, presence: true,
    length: {minimum: Settings.user_setting.password_minimum_length}

  private

  def downcase_email
    self.email = email.downcase
  end
end
