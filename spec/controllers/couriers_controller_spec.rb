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
        put :update, params: {id: courier.id, courier: attr}
        courier.reload
      end

      it { expect(response).to redirect_to(courier) }
      it { expect(courier.name).to eql attr[:name] }
      it { expect(courier.email).to eql attr[:email] }
    end
end
