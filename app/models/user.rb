class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  after_initialize :init

  validates :name, presence: true

  enum role: [:standard, :premium, :admin]

  private

  def init
    self.role ||= :standard
  end
end
