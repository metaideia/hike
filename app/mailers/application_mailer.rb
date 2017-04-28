class ApplicationMailer
  def self.send(*args)
    mailer = new
    message = mailer.message(*args)

    mailer.deliver(message)
  end

  def mandrill
    Mandrill::API.new Rails.application.secrets.mandrill_key
  end

  def deliver(message)
    mandrill.messages.send message
  end
end
