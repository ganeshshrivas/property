class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable,:confirmable, :rememberable, :trackable, :validatable
  has_many :estates, dependent: :destroy
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :estates, :pictures

end
