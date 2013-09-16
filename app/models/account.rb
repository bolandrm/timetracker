class Account < ActiveRecord::Base
  RESTRICTED_SUBDOMAINS = %w(www)

  belongs_to :owner, class_name: 'User'

  validates :subdomain, presence: true,
                        uniqueness: { case_sensitive: false },
                        format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters' },
                        exclusion: { in: RESTRICTED_SUBDOMAINS, message: 'restricted' }
  validates :owner, presence: true

  before_validation :downcase_subdomain

  accepts_nested_attributes_for :owner

private
  def downcase_subdomain
    self.subdomain = subdomain.try(:downcase)
  end
end
