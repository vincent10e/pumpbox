require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe TestAttemptsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # TestAttempt. As you add validations to TestAttempt, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TestAttemptsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all test_attempts as @test_attempts" do
      test_attempt = TestAttempt.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:test_attempts)).to eq([test_attempt])
    end
  end

  describe "GET #show" do
    it "assigns the requested test_attempt as @test_attempt" do
      test_attempt = TestAttempt.create! valid_attributes
      get :show, {:id => test_attempt.to_param}, valid_session
      expect(assigns(:test_attempt)).to eq(test_attempt)
    end
  end

  describe "GET #new" do
    it "assigns a new test_attempt as @test_attempt" do
      get :new, {}, valid_session
      expect(assigns(:test_attempt)).to be_a_new(TestAttempt)
    end
  end

  describe "GET #edit" do
    it "assigns the requested test_attempt as @test_attempt" do
      test_attempt = TestAttempt.create! valid_attributes
      get :edit, {:id => test_attempt.to_param}, valid_session
      expect(assigns(:test_attempt)).to eq(test_attempt)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new TestAttempt" do
        expect {
          post :create, {:test_attempt => valid_attributes}, valid_session
        }.to change(TestAttempt, :count).by(1)
      end

      it "assigns a newly created test_attempt as @test_attempt" do
        post :create, {:test_attempt => valid_attributes}, valid_session
        expect(assigns(:test_attempt)).to be_a(TestAttempt)
        expect(assigns(:test_attempt)).to be_persisted
      end

      it "redirects to the created test_attempt" do
        post :create, {:test_attempt => valid_attributes}, valid_session
        expect(response).to redirect_to(TestAttempt.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved test_attempt as @test_attempt" do
        post :create, {:test_attempt => invalid_attributes}, valid_session
        expect(assigns(:test_attempt)).to be_a_new(TestAttempt)
      end

      it "re-renders the 'new' template" do
        post :create, {:test_attempt => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested test_attempt" do
        test_attempt = TestAttempt.create! valid_attributes
        put :update, {:id => test_attempt.to_param, :test_attempt => new_attributes}, valid_session
        test_attempt.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested test_attempt as @test_attempt" do
        test_attempt = TestAttempt.create! valid_attributes
        put :update, {:id => test_attempt.to_param, :test_attempt => valid_attributes}, valid_session
        expect(assigns(:test_attempt)).to eq(test_attempt)
      end

      it "redirects to the test_attempt" do
        test_attempt = TestAttempt.create! valid_attributes
        put :update, {:id => test_attempt.to_param, :test_attempt => valid_attributes}, valid_session
        expect(response).to redirect_to(test_attempt)
      end
    end

    context "with invalid params" do
      it "assigns the test_attempt as @test_attempt" do
        test_attempt = TestAttempt.create! valid_attributes
        put :update, {:id => test_attempt.to_param, :test_attempt => invalid_attributes}, valid_session
        expect(assigns(:test_attempt)).to eq(test_attempt)
      end

      it "re-renders the 'edit' template" do
        test_attempt = TestAttempt.create! valid_attributes
        put :update, {:id => test_attempt.to_param, :test_attempt => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested test_attempt" do
      test_attempt = TestAttempt.create! valid_attributes
      expect {
        delete :destroy, {:id => test_attempt.to_param}, valid_session
      }.to change(TestAttempt, :count).by(-1)
    end

    it "redirects to the test_attempts list" do
      test_attempt = TestAttempt.create! valid_attributes
      delete :destroy, {:id => test_attempt.to_param}, valid_session
      expect(response).to redirect_to(test_attempts_url)
    end
  end

end
