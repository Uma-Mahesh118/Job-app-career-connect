class NotificationMailer < ApplicationMailer
  def create_action(obj)
    @user = obj
    mail to: obj.email, subject: 'Career Connect account created'
  end
  def update_action(obj)
    @user = obj
    mail to: obj.email, subject: 'Career Connect: Job Post update' 
  end
  def delete_action(obj)
    @user = obj
    mail to: obj.email, subject: 'Account deleted!!!'
  end
end
