require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:category) { create(:category) }

  describe "GET #index" do
    it 'renders index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    before { get :show, params: { id: category.id } }

    it "assigns the requested category to @category" do
      expect(assigns(:category)).to eq category
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    before { get :new }

    it "assigns a new Category to @category" do
      expect(assigns(:category)).to be_a_new(Category)
    end

    it "render new view" do
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    before { get :edit, params: { id: category.id } }

    it "assigns the requested category to @category" do
      expect(assigns(:category)).to eq category
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new category' do
        expect { post :create, params: { category: attributes_for(:category) } }.to change(Category, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { category: attributes_for(:category) }
        expect(response).to redirect_to category_path(assigns(:category))
      end
    end

    context 'with invalid attributes' do
      it 'does not save category' do
        expect { post :create, params: { category: attributes_for(:invalid_category) } }.to_not change(Category, :count)
      end

      it "re-render new view" do
        post :create, params: { category: attributes_for(:invalid_category) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'valid attributes' do
      it "assigns the requested category to @category" do
        patch :update, params: { id: category, category: attributes_for(:category) }
        expect(assigns(:category)).to eq category
      end

      it 'changes category attributes' do
        patch :update, params: { id: category, category: { name: 'New name.', description: 'New description' } }
        category.reload
        expect(category.name).to eq 'New name.'
        expect(category.description).to eq 'New description'
      end
      
      it 'redirects to the updated category' do
        patch :update, params: { id: category, category: attributes_for(:category) }
        expect(response).to redirect_to category
      end
    end

    context 'invalid attributes' do
      before do
        patch :update, params: { id: category, category: { name: nil, description: 'New description' } }
      end

      it 'does not change category attributes' do
        category.reload
        expect(category.name).to eq "Category one."
        expect(category.description).to eq "MyText"
      end

      it "re-render edit view" do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before { category }

    it 'deletes category' do
      expect { delete :destroy, params: { id: category } }.to change(Category, :count).by(-1)
    end

    it 'redirects to index view' do
      delete :destroy, params: { id: category }
      expect(response).to redirect_to categories_path
    end
  end
end
