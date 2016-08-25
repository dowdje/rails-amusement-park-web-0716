class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  validates_presence_of :name, :password, :happiness, :nausea, :height, :tickets
  validates :height, numericality: { only_integer: true}
  has_secure_password
  def logged_in?
    !!session[:user_id]
  end

  def logout
    reset_session
  end


end
