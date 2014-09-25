require "rails_helper"

RSpec.describe AdminNotificaitonMailer, :type => :mailer do
  describe "new_comment" do
    let(:mail) { AdminNotificaitonMailer.new_comment }

    it "renders the headers" do
      expect(mail.subject).to eq("New comment")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
