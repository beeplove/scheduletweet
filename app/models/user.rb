class User < ApplicationRecord
  has_many :tweets

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.token    = auth.credentials.token
      user.secret   = auth.credentials.secret
      user.save!
    end
  end
end
