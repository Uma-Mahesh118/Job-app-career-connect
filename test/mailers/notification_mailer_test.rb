require "test_helper"

class NotificationMailerTest < ActionMailer::TestCase
  test "create_action" do
    mail = NotificationMailer.create_action
    assert_equal "Create action", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "update_action" do
    mail = NotificationMailer.update_action
    assert_equal "Update action", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "delete_action" do
    mail = NotificationMailer.delete_action
    assert_equal "Delete action", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
