class ServiceMessage < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  validates :name, :email ,:problem ,:phone ,:message, presence: true
end
