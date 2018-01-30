defmodule Procore.Resources.RfisTest do
  use ExUnit.Case
  alias Procore.Resources.Rfis

  test "list/1" do
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} = Rfis.list(params)
  end
end
