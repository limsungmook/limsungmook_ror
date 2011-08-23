class Article < ActiveRecord::Base
  belongs_to :user

  attr_accessible :title, :teaser, :body, :version, :changelog
 
  validates :user_id, :presence => true
  validates :title, :presence => true, :length => { :maximum => 80 }
  validates :teaser, :presence => true, :length => { :maximum => 500 }
  validates :body, :presence => true
  validates :version, :length => { :maximum => 120 }
  validates :changelog, :length => { :maximum => 2000 }
  validates :message, :length => { :maximum => 5000 }
  validates :state, :presence => true, :numericality => true, :inclusion => { :in => 0..4 }


end
