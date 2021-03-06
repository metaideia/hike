require "test_helper"

class API::SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "success" do
    list = lists(:ebook)

    post api_subscriptions_url, params: subscription_params(name: "John", email: "john@doe.com", list_id: list.id)

    assert JSON(@response.body)["data"]
    assert_response :ok
  end

  test "success with redirect_url" do
    list = lists(:ebook)

    post api_subscriptions_url, params: subscription_params(name: "John", email: "john@doe.com", list_id: list.id, redirect_url: "http://example.com")

    assert @response.location =~ %r{http://example.com}
    assert_response :redirect
  end

  test "error" do
    list = lists(:ebook)

    post api_subscriptions_url, params: subscription_params(list_id: list.id)

    assert JSON(@response.body)["errors"]
    assert_response :unprocessable_entity
  end

  private

  def subscription_params(name: nil, email: nil, list_id: nil, redirect_url: nil)
    { data: {name: name, email: email, list_id: list_id, redirect_url: redirect_url} }
  end
end
