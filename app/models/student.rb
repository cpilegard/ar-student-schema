require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, format: { with: /\b[a-zA-Z0-9._%-]+@[a-zA-Z0-9-]+.[a-zA-Z]{2,}\b/, 
     message: "Must be a valid email."}

  validates_uniqueness_of :email
  validates :age, numericality: {greater_than: 5} 
  validates :phone, format: { with: /.*\d{3}.+\d{3}.+\d{4}.*/ }

  def name
    self.first_name + ' ' + self.last_name
  end

  def age
    # Date.today.year - self.birthday.year
    Date.today.year - self.birthday.year - ((Date.today.month > self.birthday.month || (Date.today.month == self.birthday.month && Date.today.day >= self.birthday.day)) ? 0 : 1)
  end


end
