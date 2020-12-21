class User < ActiveRecord::Base
    has_many :tasks
    has_secure_password
    validates :email, presence: true
    validates :name, presence: true
    validates :name, uniqueness: true 
end 
