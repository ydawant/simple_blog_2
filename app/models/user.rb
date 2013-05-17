 require 'bcrypt'

  class User < ActiveRecord::Base
    has_many :posts
    # users.password_hash in the database is a :string
    attr_accessor :new_password

    before_save :hash_password

    def self.auth_password(password)
      BCrypt::Password.new(password)
    end

    def hash_password
      unless self.new_password.nil?
        self.password = BCrypt::Password.create(new_password)
      end
    end    
  end
