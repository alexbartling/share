class Folder < ActiveRecord::Base
  acts_as_tree
  
  attr_accessible :name, :parent_id, :user_id
  
  
  has_many :shared_folders, :dependent => :destroy 
  belongs_to :user
  has_many :packets, :dependent => :destroy
end
