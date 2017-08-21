require 'rails_helper'

RSpec.describe "Articles", type: :request do
  before do
    @article = create(:article)
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
end
