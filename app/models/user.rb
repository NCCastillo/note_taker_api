class User < ActiveRecord::Base
  has_many :notes

  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
