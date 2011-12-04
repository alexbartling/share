require 'test_helper'

class PacketTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Packet.new.valid?
  end
end
