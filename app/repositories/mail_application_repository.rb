module MailApplicationRepository
  extend ActiveSupport::Concern

  included do
    scope :web
    scope :find_by_credentials, ->(name, password){ where(:name => name).where(:password => password) }
    scope :ordered, ->{ web.order('id DESC') }
    scope :owner_is, ->(owner){ where(:owner_id => owner.id) }
  end
end