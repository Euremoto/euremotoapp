require 'rails_helper'

RSpec.describe Job, :type => :model do

  describe ".confirmed?" do
    let(:confirmed) { FactoryGirl.build(:confirmed_job) }
    it do
      expect(confirmed).to be_confirmed
    end
  end

end
