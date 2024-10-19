class User < ApplicationRecord
  has_secure_password
  before_create :generate_session_token
  mount_uploader :avatar, AvatarUploader

  private

  def generate_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end
end

