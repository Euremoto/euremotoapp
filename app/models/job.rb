class Job < ActiveRecord::Base
  validates_presence_of :title, :description, :type, :apply

  before_save :generate_token

  def confirmed?
    confirm.present?
  end

  private
    def generate_token
      @token = SecureRandom.urlsafe_base64
    end
end
