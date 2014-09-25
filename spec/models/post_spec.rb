require 'rails_helper'

RSpec.describe Post, :type => :model do
  describe "#slug" do
    let(:post) {
      Fabricate(:post, :title => "The answer to everything & the university = 42")
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
      Fabricate(:post)
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
      Fabricate(:post)
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
    before {
      # some draft posts
      Fabricate.times(3, :post)
    }

    let!(:post_1) {
      Fabricate(:published_post)
    }

    let!(:post_2) {
      Fabricate(:published_post)
    }

    let!(:post_3) {
      Fabricate(:published_post)
    }

    subject {
      Post.published
    }

    it "reveals published posts only" do
      expect(subject).to contain_exactly(post_1, post_2, post_3)
    end
  end

  shared_context "a post whose state is draft" do
    let(:post) { Fabricate(:post) }
  end

  shared_context "a post whose state is published" do
    let(:post) { Fabricate(:published_post) }
  end

  describe "#draft?" do
    subject {
      post.draft?
    }

    context "a post whose state is draft" do
      include_context "a post whose state is draft"

      it "is true" do
        expect(subject).to be_truthy
      end
    end

    context "a post whose state is published" do
      include_context "a post whose state is published"

      it "is false" do
        expect(subject).to be_falsy
      end
    end
  end

  describe "#can_publish?" do
    subject {
      post.can_publish?
    }

    context "a post that is draft" do
      include_context "a post whose state is draft"

      it "is true" do
        expect(subject).to be_truthy
      end
    end

    context "a post that is published" do
      include_context "a post whose state is published"

      it "is false" do
        expect(subject).to be_falsy
      end
    end
  end

  describe "#to_param" do
    let(:post) {
      Fabricate(:post)
    }

    before {
      allow(post).to receive(:id) { 3 }
      allow(post).to receive(:slug) { "hello-world" }
    }

    subject {
      post.to_param
    }

    it "generates correct URL param according to id and slug" do
      expect(subject).to eq "3-hello-world"
    end
  end
end
