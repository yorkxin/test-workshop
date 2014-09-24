require 'rails_helper'

RSpec.describe "Comments", :type => :request do
  describe "POST /posts/xxx/comments" do
    # Simplify this with Fabricate()
    let!(:the_post) {
      Fabricate(:post)
    }

    subject {
      post "/posts/1/comments", :comment => comment_params
    }

    context "filling all fields" do
      let(:comment_params) {
        {
          :author => "John Appleseed",
          :content => "Good article. I like it."
        }
      }

      context "a post that is published" do
        # Simplify this with Fabricate()
        before {
          the_post.publish!
        }

        it "creates a new comment" do
          expect {
            subject
          }.to change { the_post.comments.count }.by(1)
        end
      end

      context "a post that is draft" do
        # Simplify this with Fabricate()
        it "does not create a new comment" do
          expect {
            subject rescue nil # ignore any exception
          }.not_to change { the_post.comments.count }
        end
      end
    end

    describe "missing params" do
      # Simplify this with Fabricate()
      before {
        the_post.publish!
      }

      context "missing author" do
        let(:comment_params) {
          {
            :author => "",
            :content => "Good article. I like it."
          }
        }

        it "does not create a new comment" do
          expect {
            subject
          }.not_to change { the_post.comments.count }
        end
      end

      context "missing content" do
        let(:comment_params) {
          {
            :author => "John Appleseed",
            :content => ""
          }
        }

        it "does not create a new comment" do
          expect {
            subject
          }.not_to change { the_post.comments.count }
        end
      end
    end
  end
end
