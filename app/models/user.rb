class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  after_initialize :init

  validates :name, presence: true

  enum role: [:standard, :premium, :admin]

  has_many :collaborators, dependent: :destroy

  def collaborator_for wiki
    collaborators.where(wiki_id: wiki.id).first
  end

  private

  def init
    self.role ||= :standard
  end
end
