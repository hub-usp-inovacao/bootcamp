# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV['email_username'],
          to: ENV['email_username'],
          cc: ENV['email_dev_username']

  def subject(text)
    "Hub USP Inovação - #{text}"
  end
end
