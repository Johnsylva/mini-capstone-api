require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "is_discounted" do
    product = Product.new(price:20)
    assert_equal false, product.is_discounted
  end

  test "tax" do
    product = Product.new(price:20)
    assert_equal 1.8, product.tax
  end

  test "total" do
    product = Product.new(price:20)
    assert_equal 21.8, product.total
  end

  test "friendly_created_at" do
    product = Product.new(created_at: "2025-11-05 02:40:27.262209000 +0000")
    assert_equal "Nov  5,  2:40 AM", product.friendly_created_at
  end
end
