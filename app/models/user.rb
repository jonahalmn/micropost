# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nom        :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'digest'

class User < ApplicationRecord

  def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  attr_accessor :password
  validates :nom, :presence => true,
            :length => {:maximum => 50}

  validates :email, :presence => true,
            :format   => email_regex ,
            :uniqueness => {:case_sensitive => false}

  validates :password, :presence     => true,
            :confirmation => true,
            :length       => { :within => 6..40 }


            before_save :encrypt_password

            def has_password?(password_soumis)
              encrypted_password == encrypt(password_soumis)
            end

  private

  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
