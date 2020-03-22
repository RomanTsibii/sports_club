class User < ApplicationRecord
  has_many :user_subscriptions
  has_many :subscriptions, through: :user_subscriptions

  enum role: [:admin, :trainers, :sportsman ]
  after_initialize :set_default_role, :if => :new_record?

  # scope :published, -> { where(published: true) }
  # scope :trainer, -> { where(role: "trainer")}

  def set_default_role
    self.role ||= :sportsman
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  validates :full_name, presence: true, length: {in: 6..50}


  # device authentication with facebook
  def self.from_omniauth(auth) # OmniAuth for facebook
    user = User.where(email: auth.info.email).first

    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.full_name = auth.info.name   # assuming the user model has a name
        user.image = auth.info.image # assuming the user model has an image

        user.uid = auth.uid
        user.provider = auth.provider
      end
    end
  end

end
