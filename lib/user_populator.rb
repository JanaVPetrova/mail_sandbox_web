module UserPopulator
  def self.via_facebook(user, data)
    user.build_facebook :uid => data[:uid]
  end
end