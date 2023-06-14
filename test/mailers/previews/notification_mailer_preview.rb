# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/create_action
  def create_action
    NotificationMailer.create_action
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/update_action
  def update_action
    NotificationMailer.update_action
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/delete_action
  def delete_action
    NotificationMailer.delete_action
  end

end
