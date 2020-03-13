# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CouriersController, type: :controller do

  let!(:courier) { create :courier }

  describe 'GET #index' do
    subject { get :index }

    it 'render index view' do
      is_expected.to render_template :index
    end

    it 'should show courier' do
      get :show, params: { id: courier.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE #destroy' do
    let!(:courier) { create :courier }
    subject { get :index }
      context 'delete from courier table' do
        it 'delete courier' do
          expect { delete :destroy, params: {id: courier.id} }.to change { Courier.count }.by(-1)
        end

        it 'after delete response successful' do
          expect(response).to be_successful
        end

        it 'render view new after destroy' do
          is_expected.to render_template :index
        end
      end
  end

  describe "PATCH #update" do
    let(:attr) { { name: 'Kanban', email: 'ex@ex.com' } }

      before(:each) do
        patch :update, params: {id: courier.id, courier: attr}
        courier.reload
      end
      context "valid attributes" do
        it { expect(response).to redirect_to(courier) }
        it { expect(courier.name).to eq('Kanban')}
        it { expect(courier.email).to eql attr[:email] }
      end

      context "with invalid attributes" do
        it "does not change the courier's attributes" do
          patch :update, params: {id: courier.id, courier: { name: 'Kanban', email: nil }}
          courier.reload
          expect(courier.name).to_not eq('Larry')
          expect(courier.email).to eq('ex@ex.com')

        end

        it "re-renders the edit template" do
          patch :update, params: {id: courier.id, courier: { name: 'Kanban', email: nil }}
          courier.reload
          expect(response).to render_template :edit
        end
      end

  end


  describe 'GET #new' do
    it "assigns a new Courier to @courier" do
      get :new
      expect(assigns(:courier)).to be_a_new(Courier)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    let!(:courier) { create :courier }
    it "assigns the requested courier to @courier" do

      get :edit, params: {id: courier.id, courier: courier}
      expect(assigns(:courier)).to eq courier
    end

    it "renders the :edit template" do
      get :edit, params: {id: courier.id, courier: courier}
      expect(response).to render_template :edit
      end
    end
end
