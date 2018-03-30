defmodule Procore.Resources.WorkOrderContracts do
  @moduledoc """
  Available actions for the Work Order Contract resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Work Order Contracts in a project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/work_order_contracts")
    |> Request.insert_query_params(params)
    |> Procore.send_request()
  end

  @doc """
  Returns a Work Order Contract and associated records.
  """
  @spec show(%{
          (project_id :: String.t()) => pos_integer,
          (work_order_contract_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def show(%{"project_id" => project_id, "work_order_contract_id" => work_order_contract_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/work_order_contracts/#{work_order_contract_id}")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request()
  end

  @doc """
  Creates or updates a batch of Work Order Contracts.
  """
  @spec sync(%{(project_id :: String.t()) => pos_integer, (rfi :: String.t()) => map}) ::
          %ResponseResult{} | %ErrorResult{}
  def sync(%{"project_id" => project_id, "work_order_contracts" => work_order_contracts}) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/work_order_contracts/sync")
    |> Request.insert_body(%{"project_id" => project_id, "updates" => work_order_contracts})
    |> Procore.send_request()
  end
end
