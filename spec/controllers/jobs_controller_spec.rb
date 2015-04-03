require 'rails_helper'
describe JobsController, :type => :controller do
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:confirmed_job)
    # skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    # skip("Add a hash of attributes invalid for your model")
    attr = FactoryGirl.attributes_for(:confirmed_job)
    attr.delete :company_name
    attr
  }
  let(:valid_session) { {} }

  describe "GET show" do
    it "assigns the requested job as @job" do
      job = Job.create! valid_attributes
      get :show, {:id => job.to_param}, valid_session
      expect(assigns(:job)).to eq(job)
    end
  end

  describe "GET new" do
    it "assigns a new job as @job" do
      get :new, {}, valid_session
      expect(assigns(:job)).to be_a_new(Job)
    end
  end

  describe "GET edit" do
    it "assigns the requested job as @job" do
      job = Job.create! valid_attributes
      get :edit, {:id => job.to_param}, valid_session
      expect(assigns(:job)).to eq(job)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Job" do
        expect {
          post :create, {:job => valid_attributes}, valid_session
        }.to change(Job, :count).by(1)
      end

      it "assigns a newly created job as @job" do
        post :create, {:job => valid_attributes}, valid_session
        expect(assigns(:job)).to be_a(Job)
        expect(assigns(:job)).to be_persisted
      end

      it "redirects to the created job" do
        post :create, {:job => valid_attributes}, valid_session
        expect(response).to redirect_to(Job.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved job as @job" do
        post :create, {:job => invalid_attributes}, valid_session
        expect(assigns(:job)).to be_a_new(Job)
      end

      it "re-renders the 'new' template" do
        post :create, {:job => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for :confirmed_job
      }

      it "updates the requested job" do
        job = Job.create! valid_attributes
        put :update, {:id => job.to_param, :job => new_attributes}, valid_session
        job.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested job as @job" do
        job = Job.create! valid_attributes
        put :update, {:id => job.to_param, :job => valid_attributes}, valid_session
        expect(assigns(:job)).to eq(job)
      end

      it "redirects to the job" do
        job = Job.create! valid_attributes
        put :update, {:id => job.to_param, :job => valid_attributes}, valid_session
        expect(response).to redirect_to(job)
      end
    end

    describe "with invalid params" do
      it "assigns the job as @job" do
        job = Job.create! valid_attributes
        put :update, {:id => job.to_param, :job => invalid_attributes}, valid_session
        expect(assigns(:job)).to eq(job)
      end

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested job" do
      job = Job.create! valid_attributes
      expect {
        delete :destroy, {:id => job.to_param}, valid_session
      }.to change(Job, :count).by(-1)
    end

    it "redirects to the jobs list" do
      job = Job.create! valid_attributes
      delete :destroy, {:id => job.to_param}, valid_session
      expect(response).to redirect_to(jobs_url)
    end
  end

end
