defmodule Procore.Resources.ScheduleTasks do
  @moduledoc """
  Available actions for the schedule task resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Create a schedule task.
  """
  @spec create(%{(project_id :: String.t()) => pos_integer, (task :: String.t()) => map}) ::
          %ResponseResult{} | %ErrorResult{}
  def create(client, %{"project_id" => _project_id, "task" => _task} = params) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/tasks")
    |> Request.insert_body(params)
    |> Procore.send_request()
  end
end
