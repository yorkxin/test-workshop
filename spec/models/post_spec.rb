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

  describe "default state" do
    let(:post) {
      Post.create(:title => "Hello! World")
    }

    subject {
      post.state
    }

    it "is draft" do
      expect(subject).to eq "draft"
    end
  end

  describe "#publish!" do
    let(:post) {
      Post.create(:title => "Don't Care")
    }

    before {
      post.publish!
    }

    subject {
      post.state
    }

    it "becomes published" do
      expect(subject).to eq "published"
    end
  end
end
