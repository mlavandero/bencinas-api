require 'test_helper'

class CombustibleTest < ActiveSupport::TestCase
  test "correct slug" do
    Combustible.all.each do |combustible|
      assert_match(/^\S*$/, combustible.slug, combustible.slug)
    end
  end
end
