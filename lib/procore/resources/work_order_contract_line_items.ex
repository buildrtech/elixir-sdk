defmodule Procore.Resources.WorkOrderContractLineItems do
  @moduledoc """
  Available actions for the Work Order Contract Line Item resource.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Line Items for a specific Work Order Contract.
  """
  @spec list(%{
          (project_id :: String.t()) => pos_integer,
          (work_order_contract_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => project_id, "work_order_contract_id" => work_order_contract_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/work_order_contracts/#{work_order_contract_id}/line_items")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request()
  end

  @doc """
  Creates a Work Order Contract Line Item.
  """
  @spec create(%{
          (project_id :: String.t()) => pos_integer,
          (work_order_contract_id :: String.t()) => pos_integer,
          (line_item :: String.t()) => map
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(%{
        "project_id" => project_id,
        "work_order_contract_id" => work_order_contract_id,
        "line_item" => line_item
      }) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/work_order_contracts/#{work_order_contract_id}/line_items")
    |> Request.insert_body(%{"project_id" => project_id, "line_item" => line_item})
    |> Procore.send_request()
  end
end
