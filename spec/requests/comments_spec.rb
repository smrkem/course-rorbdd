require 'rails_helper'

RSpec.describe "Comments", type: :request do
  before do
    @user1 = create(:user)
    @user2 = create(:user)
    @article = create(:article, user: @user1)
  end

  describe "POST /articles/:id/comments" do
    context "with a non signed-in user" do
      before do
        post "/articles/#{@article.id}/comments", params: { comment: { body: "Test comment" } }
      end

      it "redirects user to the signin page" do
        expect(response).to redirect_to new_user_session_path
        expect(flash[:alert]).to eq "Please sign in or sign up first"
      end
    end

    context "with a logged in user" do
      before do
        login_as(@user2)
        post "/articles/#{@article.id}/comments", params: { comment: { body: "Test comment" } }
      end

      it "creates the comment successfully" do
        expect(response).to redirect_to @article
        expect(flash[:notice]).to eq "Comment has been created"
      end
    end
  end
end
