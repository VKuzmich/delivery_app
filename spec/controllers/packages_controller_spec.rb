# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PackagesController, type: :controller do

    # render_views
    #
    # let(:courier) { create :courier}
    # let!(:packages) { create :package_item}
    #
    # describe 'GET #show' do
    #   subject { get :show }
    #
    #   it 'render show view' do
    #     sign_in(user)
    #     is_expected.to render_template :show
    #     expect(response.body).to include(product.title)
    #   end
    #
    #   describe 'DELETE #destroy' do
    #     subject { delete :destroy }
    #     context 'delete from cart' do
    #       it 'delete product from cart' do
    #         sign_in(user)
    #         expect { subject }.to change { user.reload.cart.present? }.to(false)
    #       end
    #
    #       it 'delete product from cart_items' do
    #         sign_in(user)
    #         expect { subject }.to change(user.cart.cart_items, :count).by(-1)
    #       end
    #
    #       it 'render view show after destroy' do
    #         is_expected.to render_template :show
    #       end
    #     end
    #   end
    # end
end
