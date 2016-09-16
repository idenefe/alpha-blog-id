class User < ActiveRecord::Base
 # validates :title, presence: true,length: {minimum:3, maximum:50}
  #validates :description, presence: true
  validates :username, 
    presence: true, 
    #uniqueness: true, # will not duplicates but is case sensitive (joe!=Joe)
    uniqueness:{case_sensitive: false}, # will not allow duplicates regardless of case (joe==Joe)
    length: {minimum:3,maximum:25}
  
end