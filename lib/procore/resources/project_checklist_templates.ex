defmodule Procore.Resources.ProjectChecklistTemplates do
  @moduledoc """
  Available actions for the Checklist Template resource at the project level.
  """

  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists all Checklist Template for a Project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/checklist/list_templates")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request()
  end

  @doc """
  Returns a Project Checklist Template.
  """
  @spec find(%{
          (project_id :: String.t()) => pos_integer,
          (list_template_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def find(%{"project_id" => project_id, "list_template_id" => list_template_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/checklist/list_templates/#{list_template_id}")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request()
  end

  @doc """
  Creates a Project Checklist Template from a Company Checklist Template.
  """
  @spec create_from_company_template(%{
          (project_id :: String.t()) => pos_integer,
          (source_template_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def create_from_company_template(
        %{"project_id" => _project_id, "source_template_id" => _source_template_id} = params
      ) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/checklist/list_templates/create_from_company_template")
    |> Request.insert_body(params)
    |> Procore.send_request()
  end
end
