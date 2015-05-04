class Ninja < ActiveRecord::Base
  # This will make sure a user inputes a name or it will raise an error
  validates :name, :secret_name, presence: true
  serialize :weapons, Array
  # Class method of attack
  def self.attack     
    puts "Ninjas all attack"
  end 

  def hide
    puts "I am hiding"
  end  
 
end
