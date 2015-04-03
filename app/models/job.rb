class Job < ActiveRecord::Base
  include PgSearch

  has_and_belongs_to_many :tags

  default_scope { where(created_at: 1.month.ago .. Time.now).order(created_at: :desc) }
  scope :programmers, -> { where("job_type = 'programming'") }
  scope :designers, -> { where("job_type = 'designer'") }
  pg_search_scope :search, against: [:title, :description, :company_name]

  validates_presence_of :title, :description, :apply, :company_name, :company_email

  before_save :generate_token, :slugify

  def confirmed?
    confirm.present?
  end

  private
    def generate_token
      self.token = SecureRandom.urlsafe_base64
    end

    def slugify
      self.slug = "#{company_name.parameterize}-#{title.parameterize}".downcase
    end
end
