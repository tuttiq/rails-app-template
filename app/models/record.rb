class Record < ActiveRecord::Base
  attr_accessible :name, :comments
  
  validates_presence_of :name, :comments

  def to_s
    self.name
  end

  def self.search (term)
    if term.present?
      where("name LIKE ?", "%#{term}%")
    else
      all
    end
  end

end
