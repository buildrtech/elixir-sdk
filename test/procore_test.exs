defmodule ProcoreTest do
  use ExUnit.Case
  doctest Procore

  alias Procore.Request
  alias Procore.ResponseResult

  test "making a GET request" do
    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} =
             Procore.send_request(%Request{
               request_type: :get,
               endpoint: "/vapid/endpoint"
             })
  end

  test "making a POST request" do
    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Procore.send_request(%Request{
               request_type: :post,
               endpoint: "/vapid/endpoint"
             })
  end

  test ":unset request_type on send_request/1" do
    assert_raise ArgumentError, fn ->
      Procore.send_request(%Request{
        request_type: :unset,
        endpoint: "/vapid/endpoint"
      })
    end
  end

  test "empty endpoint on send_request/1" do
    assert_raise ArgumentError, fn ->
      Procore.send_request(%Request{
        request_type: :get,
        endpoint: ""
      })
    end
  end
end
