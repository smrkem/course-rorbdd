require 'rails_helper'

RSpec.describe "Articles", type: :request do
  before do
    @user1 = create(:user)
    @user2 = create(:user)
    @article = create(:article, user: @user1)
  end

  describe "DELETE /articles/:id" do
    context "with non-signed in user" do
      before { delete "/articles/#{@article.id}" }

      it "redirects to the signin page" do
        expect(response.status).to eq 302
        expect(flash[:alert]).to eq "You need to sign in or sign up before continuing."
      end
    end

    context "with non-owner" do
      before do
        login_as(@user2)
        delete "/articles/#{@article.id}"
      end

      it "redirects to the home page" do
        expect(response.status).to eq 302
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to eq "You can only delete your own article."
      end
    end

    context "with owner" do
      before do
        login_as(@user1)
        delete "/articles/#{@article.id}"
      end

      it "successfully deletes article" do
        expect(response.status).to eq 302
        expect(flash[:success]).to eq "Article has been deleted"
      end
    end
  end

  describe "GET /articles/:id" do
    context "with existing article" do
      before { get "/articles/#{@article.id}"}

      it "handles existing article" do
        expect(response.status).to eq 200
      end
    end

    context "with non-existing article" do
      before { get "/articles/xxxx" }

      it "handles non-existing articles" do
        expect(response.status).to eq 302
        expect(flash[:danger]).to eq "The article you are looking for could not be found"
      end
    end
  end

  describe "GET /articles/:id/edit" do
    context "with non-signed in user" do
      before { get "/articles/#{@article.id}/edit" }

      it "redirects to the signin page" do
        expect(response.status).to eq 302
        expect(flash[:alert]).to eq "You need to sign in or sign up before continuing."
      end
    end

    context "with non-owner" do
      before do
        login_as(@user2)
        get "/articles/#{@article.id}/edit"
      end

      it "redirects to the home page" do
        expect(response.status).to eq 302
        expect(flash[:alert]).to eq "You can only edit your own article."
      end
    end

    context "with owner" do
      before do
        login_as(@user1)
        get "/articles/#{@article.id}/edit"
      end

      it "successfully edits article" do
        expect(response.status).to eq 200
      end
    end
  end
end
