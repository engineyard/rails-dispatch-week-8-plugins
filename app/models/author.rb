class Author < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :registerable, :confirmable and :timeoutable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :age, :password, :password_confirmation

  has_many :posts, :dependent => :destroy
  validates :name, :age, :presence => true
end
