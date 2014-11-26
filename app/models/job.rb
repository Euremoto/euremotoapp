class Job < ActiveRecord::Base
  default_scope { where "confirm IS NOT NULL" }

  validates_presence_of :title, :description, :type, :apply

  before_save :generate_token

  def self.search(search)
    wildcard_search = "%#{search}%"
    where("title LIKE ? OR description LIKE ?", wildcard_search, wildcard_search)
  end

  def confirmed?
    confirm.present?
  end

  private
    def generate_token
      @token = SecureRandom.urlsafe_base64
    end
end
