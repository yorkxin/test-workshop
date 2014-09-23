require 'rails_helper'

RSpec.describe Post, :type => :model do
  describe "#slug" do
    let(:post) {
      Post.create(:title => "The answer to everything & the university = 42")
    }

    subject {
      post.slug
    }

    it "generates proper slug" do
      expect(subject).to eq("the-answer-to-everything-the-university-42")
    end
  end
end
