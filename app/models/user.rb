class User < ApplicationRecord
  before_create :downcase_fields

	has_secure_password

  has_many :blogs

  private
    def downcase_fields
      self[:email].downcase!
    end
end
