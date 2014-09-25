require 'rails_helper'

RSpec.describe "Comments", :type => :request do
  describe "POST /posts/xxx/comments" do
    subject {
      post "/posts/1/comments", :comment => comment_params
    }

    shared_examples "not creating a new comment" do
      it "does not create a new comment" do
        expect {
          subject rescue nil # ignore any exception
        }.not_to change { the_post.comments.count }
      end
    end

    context "filling all fields" do
      let(:comment_params) {
        {
          :author => "John Appleseed",
          :content => "Good article. I like it."
        }
      }

      context "a post that is published" do
        let!(:the_post) {
          Fabricate(:published_post)
        }

        it "creates a new comment" do
          expect {
            subject
          }.to change { the_post.comments.count }.by(1)
        end
      end

      context "a post that is draft" do
        let!(:the_post) {
          Fabricate(:post)
        }

        it_behaves_like "not creating a new comment"
      end
    end

    describe "missing params" do
      let!(:the_post) {
        Fabricate(:published_post)
      }

      context "missing author" do
        let(:comment_params) {
          {
            :author => "",
            :content => "Good article. I like it."
          }
        }

        it_behaves_like "not creating a new comment"
      end

      context "missing content" do
        let(:comment_params) {
          {
            :author => "John Appleseed",
            :content => ""
          }
        }

        it_behaves_like "not creating a new comment"
      end
    end
  end
end
