defmodule Procore.Resources.Hazards do
  @moduledoc """
  Available actions for the Hazard resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Hazards in a Project.
  """
  @spec list(%{(company_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"company_id" => company_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/hazards")
    |> Request.insert_query_params(params)
    |> Procore.send_request()
  end

  @doc """
  Gets a single Hazard.
  """
  @spec find(%{
          (company_id :: String.t()) => pos_integer,
          (hazard_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(%{"company_id" => company_id, "hazard_id" => hazard_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/hazards/#{hazard_id}")
    |> Request.insert_query_params(%{"company_id" => company_id})
    |> Procore.send_request()
  end

  @doc """
  Creates an Hazard.
  """
  @spec create(%{
          (company_id :: String.t()) => pos_integer,
          (hazard :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(%{"company_id" => company_id, "hazard" => hazard} = params) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/hazards")
    |> Request.insert_body(params)
    |> Procore.send_request()
  end
end
