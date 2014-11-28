class Job < ActiveRecord::Base
  has_and_belongs_to_many :tags

  default_scope { where(created_at: 1.month.ago .. Time.now).order(created_at: :desc) }
  scope :programmers, -> { where("job_type = 'programming'") }
  scope :designers, -> { where("job_type = 'designer'") }

  validates_presence_of :title, :description, :apply, :company_name, :company_email

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
