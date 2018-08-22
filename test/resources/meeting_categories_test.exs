defmodule Procore.Resources.MeetingsCategoriesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.MeetingCategories

  test "create/1" do
    client = Procore.client()
    params = %{"meeting_id" => 1, "project_id" => 1, "meeting_category" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             MeetingCategories.create(client, params)
  end
end
