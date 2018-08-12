defmodule Procore.Resources.ProjectsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Projects

  test "find/1" do
    params = %{"company_id" => 1, "project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} = Projects.find(params)
  end

  test "list/1" do
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: %{}} = Projects.list(params)
  end

  test "create/1" do
    params = %{"company_id" => 1, "project" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Projects.create(params)
  end
end
