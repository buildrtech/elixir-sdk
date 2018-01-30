alias Procore.ResponseResult

defmodule Procore.Resources.LocationsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Locations

  test "list/1" do
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} = Locations.list(params)
  end
end
