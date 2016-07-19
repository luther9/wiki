class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user

  validates :user, presence: true

  has_many :collaborators, dependent: :destroy

  def self.visible_to user
    if user && (user.admin? || user.premium?)
      all
    else
      where private: false
    end
  end
end
