class Book < ActiveRecord::Base
  attr_accessible :author, :name, :status
end
