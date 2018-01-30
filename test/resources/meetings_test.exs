alias Procore.ResponseResult

defmodule Procore.Resources.MeetingsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Meetings

  test "get/1" do
    params = %{"meeting_id" => 1, "project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} = Meetings.find(params)
  end

  test "list/1" do
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} = Meetings.list(params)
  end
end
