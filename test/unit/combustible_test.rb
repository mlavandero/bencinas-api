require 'test_helper'

class CombustibleTest < ActiveSupport::TestCase
  test "correct slug" do
    Combustible.all.each do |combustible|
      assert_match(/^\S*$/, combustible.slug, combustible.slug)
    end
  end

  test "finding combustible by slug" do
    assert_equal(Combustible.find_by_slug('gasolina-93'), Combustible.find_by_nombre("Gasolina 93"))
    assert_nil(Combustible.find_by_slug('gasolina-100'))
  end

  test "finding by id or by slug" do
    combustible = Combustible.first
    assert_equal(Combustible.find_by_id_or_slug(combustible.id), combustible)
    assert_equal(Combustible.find_by_id_or_slug(combustible.slug), combustible)
  end
end
