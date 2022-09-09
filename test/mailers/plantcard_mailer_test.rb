require "test_helper"

class PlantcardMailerTest < ActionMailer::TestCase
  test "loading_confirmation" do
    mail = PlantcardMailer.loading_confirmation
    assert_equal "Loading confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
