class User < ActiveRecord::Base
  has_many :articles
  before_save { #run this block on save
    self.email = email.downcase
  }
  validates :username, 
    presence: true, 
    #uniqueness: true, # will not duplicates but is case sensitive (joe!=Joe)
    uniqueness:{case_sensitive: false}, # will not allow duplicates regardless of case (joe==Joe)
    length: {minimum:3,maximum:25}
  VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    presence:true,
    #uniqueness:{case_sensitive: false},
    uniqueness: true, #case sensitive not needed because of downcase in befor_save
    format: {with: VALID_EMAIL_REGEX}
    
end