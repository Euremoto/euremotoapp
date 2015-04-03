require 'rails_helper'

describe JobsHelper, :type => :helper do

  describe ".new_job?" do
    let(:job) { FactoryGirl.create(:confirmed_job) }
    let(:old_job) { FactoryGirl.create(:old_job) }

    it { expect(new_job?(job)).to be_truthy }
    it { expect(new_job?(old_job)).to be_falsey }
  end

end
