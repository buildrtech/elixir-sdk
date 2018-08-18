defmodule Procore.Resources.DrawingAreas do
  @moduledoc """
  Available actions for the Drawing Area resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all drawing areas in a project.
  """
  @spec list(Tesla.Client.t(), %{(project_id :: String.t()) => pos_integer}) ::
          %ResponseResult{} | %ErrorResult{}
  def list(client, %{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/drawing_areas")
    |> Procore.send_request()
  end

  @doc """
  Creates a drawing area.
  """
  @spec create(%{(project_id :: String.t()) => pos_integer, (name :: String.t()) => String.t()}) ::
          %ResponseResult{} | %ErrorResult{}
  def create(client, %{"project_id" => project_id, "name" => name}) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/drawing_areas")
    |> Request.insert_body(%{"name" => name})
    |> Procore.send_request()
  end
end
