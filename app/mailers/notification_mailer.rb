class NotificationMailer < ApplicationMailer
  def create_action(obj)
    @user = obj
    mail to: obj.email
  end
  def update_action(obj, post)
    @post = post
    @user = post
    mail to: obj.email
  end
  def delete_action(obj)
    @user = obj
    mail to: obj.email
  end
end
