class Wiki < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true

  def self.visible_to user
    if user && (user.admin? || user.premium?)
      all
    else
      where private: false
    end
  end
end
