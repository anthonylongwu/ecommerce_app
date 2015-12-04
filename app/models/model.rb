class Model < ActiveRecord::Base
  has_many :products
  has_many :carted_products
  has_many :orders
  belongs_to :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable




  def admin?
    role.name == "admin"
  end

  def shopper?
    role.name == "shopper"
  end


end
