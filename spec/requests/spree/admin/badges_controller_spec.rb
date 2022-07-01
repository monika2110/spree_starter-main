require 'rails_helper'

RSpec.describe Spree::Admin::BadgesController, type: :controller do
  before do
    admin = FactoryBot.create(:admin_user)
    sign_in(admin)
  end

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'name' => ''
    }
  end
  let(:valid_attributes) do
    {
      'id' => '1',
      'name' => '%',
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      badge = Spree::Badge.create(valid_attributes)
      get :edit, params: { id: badge.id }
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Badge' do
        expect do
          post :create, params: { badge: valid_attributes }
        end.to change(Spree::Badge, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Badge' do
        expect do
          post :create, params: { badge: invalid_attributes }
        end.to change(Spree::Badge, :count).by(0)
      end
    end

    it 'redirects to index' do
      post :create, params: { badge: valid_attributes }
      expect(response).to redirect_to(admin_badges_url)
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          'id' => '1',
          'name' => 'new_name',
        }
      end

      it 'updates the requested badge' do
        badge = Spree::Badge.create(valid_attributes)
        patch :update, params: { id: badge.id, badge: new_attributes }
        badge.reload
      end

      it 'redirects to index' do
        badge = Spree::Badge.create(valid_attributes)
        patch :update, params: { id: badge.id, badge: new_attributes }
        badge.reload
        expect(response).to redirect_to(admin_badges_url)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested badge' do
      badge = Spree::Badge.create(valid_attributes)
      expect do
        delete :destroy, params: { id: badge.id }
      end.to change(Spree::Badge, :count).by(-1)
    end

    it 'redirects to index' do
      badge = Spree::Badge.create(valid_attributes)
      delete :destroy, params: { id: badge.id }
      expect(response).to redirect_to(admin_badges_url)
    end
  end
end
