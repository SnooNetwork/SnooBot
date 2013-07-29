class User < ActiveRecord::Base
  has_and_belongs_to_many :permissions
  belongs_to :group
end