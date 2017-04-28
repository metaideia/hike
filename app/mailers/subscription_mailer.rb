class SubscriptionMailer < ApplicationMailer
  def message(subscription, redirect_url)
    {
      from_name: subscription.list_name_from,
      from_email: subscription.list_email_from,
      to: [{ email: subscription.lead_email }],
      subject: subscription.list_email_subject,
      html: SubscriptionMailRenderer.call(subscription, redirect_url)
    }
  end
end
