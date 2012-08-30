class Rating < ActiveRecord::Base
  attr_accessible :stars, :user_id
  
  belongs_to :user
  
  validates :stars, :numericality => { :only_integer => true }
  validates :stars, :numericality => { :greater_than_or_equal_to => 1,
                                       :less_than_or_equal_to => 4, 
                                       :message => "Must be between 1 and 4" }
end
