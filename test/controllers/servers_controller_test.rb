require "test_helper"

class ServersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @server = servers(:one)
  end

  test "should get index" do
    get servers_url
    assert_response :success
  end

  test "should get new" do
    get new_server_url
    assert_response :success
  end

  test "should create servers" do
    assert_difference("Server.count") do
      post servers_url, params: { server: { name: @server.name, owner_id: @server.owner_id } }
    end

    assert_redirected_to server_url(Server.last)
  end

  test "should show servers" do
    get server_url(@server)
    assert_response :success
  end

  test "should get edit" do
    get edit_server_url(@server)
    assert_response :success
  end

  test "should update servers" do
    patch server_url(@server), params: { server: { name: @server.name, owner_id: @server.owner_id } }
    assert_redirected_to server_url(@server)
  end

  test "should destroy servers" do
    assert_difference("Server.count", -1) do
      delete server_url(@server)
    end

    assert_redirected_to servers_url
  end
end
