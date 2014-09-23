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

  describe ".published" do
    pending "we'll do this later with factory"
  end

  describe "#draft?" do
    let(:post) {
      Post.create(:title => "I'm almost tired to type title")
    }

    subject {
      post.draft?
    }

    context "a post whose state is draft" do
      before {
        allow(post).to receive(:state) { "draft" }
      }

      it "is true" do
        expect(subject).to be_truthy
      end
    end

    context "a post whose state is published" do
      before {
        allow(post).to receive(:state) { "published" }
      }

      it "is false" do
        expect(subject).to be_falsy
      end
    end
  end

  describe "#can_publish?" do
    let(:post) {
      Post.create(:title => "I'm almost tired to type title")
    }

    subject {
      post.can_publish?
    }

    context "a post that is draft" do
      before {
        # stub here
      }

      it "is true" do
        expect(subject).to be_truthy
      end
    end

    context "a post that is published" do
      before {
        # stub here
      }

      it "is false" do
        expect(subject).to be_falsy
      end
    end
  end

  describe "#to_param" do
    # Add let and subject here

    # stub id and slub here

    it "generates correct URL param according to id and slug" do
      # add expect here
    end
  end
end
