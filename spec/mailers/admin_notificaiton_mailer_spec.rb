require "rails_helper"

RSpec.describe AdminNotificaitonMailer, :type => :mailer do
  describe "new_comment" do
    let(:comment) {
      Fabricate(:comment) do
        post { Fabricate(:post, :title => "Awesome Article") }
      end
    }

    before {
      AdminNotificaitonMailer.new_comment(comment).deliver
    }

    let(:mail) { last_email }

    # Why not "subject"? because there is a "subject" in the email,
    # to avoid conflict, we use "mail" here. Sure you can use use "subject".

    it "renders the headers" do
      expect(mail.subject).to eq("[Blog] Awesome Article got a new comment.")
      expect(mail.to).to eq(["admin@example.org"])
      expect(mail.from).to eq(["no-reply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Awesome Article got a new comment.")
    end
  end

end
