class Talk < ActiveRecord::Base
  validates  :user, :presence => true
  validates :content, :presence => true, :length => { :minimum => 5 }
  has_many :relays, :dependent => :destroy
end
