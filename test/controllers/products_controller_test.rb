require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    #p "--------"
    #p data
    #p "--------"
    assert_equal Product.count, data.count
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "image_url", "description", "is_discounted","tax", "total", "friendly_created_at"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: {id: "car", name: "hen", inventory: 2, price: 1000, image_url: "car.JPG", description: "best car ever"}
      assert_response 201
    end

    assert_difference "Product.count", 0 do
      post "/products.json", params: {}
      assert_response 422
    end
  end

  test "update" do
    product = Product.first
    #puts product.name
    put "/products/#{product.id}.json", params: {name: "updated name"}
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end

end
