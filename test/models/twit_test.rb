require "test_helper"

class TwitTest < ActiveSupport::TestCase
  def twit
    @twit ||= Twit.new
  end

  def test_valid
    assert twit.valid?
  end
end
