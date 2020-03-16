class User < ApplicationRecord
  enum role: [:admin, :trainer, :user ]
  after_initialize :set_default_role, :if => :new_record?

  # scope :published, -> { where(published: true) }
  scope :trainer, -> { where(role: "trainer")}

  def set_default_role
    self.role ||= :user
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: true, length: {in: 6..50}

end
