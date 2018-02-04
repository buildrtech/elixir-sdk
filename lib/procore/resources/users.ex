defmodule Procore.Resources.Users do
  @moduledoc """
  Available actions for the user resource.
  """
  alias Procore.Resources.Users.ResponseBodyTypes
  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Adds an existing user from a company to a project's directory in that company.
  """
  @spec add_user_to_project(%{
          (project_id :: String.t()) => pos_integer,
          (user_id :: String.t()) => pos_integer,
          (permission_template_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def add_user_to_project(%{
        "project_id" => project_id,
        "user_id" => user_id,
        "permission_template_id" => permission_template_id
      }) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/projects/#{project_id}/users/#{user_id}/actions/add")
    |> Request.insert_body(build_add_user_to_project_body(permission_template_id))
    |> Procore.send_request()
  end

  defp build_add_user_to_project_body(permission_template_id) do
    %{"user" => %{"permission_template_id" => permission_template_id}}
  end

  @doc """
  List all users in a company directory.
  """
  @spec list(%{(company_id :: String.t()) => integer}) ::
          %ResponseResult{
            status_code: DefinedTypes.non_error_status_code(),
            parsed_body: ResponseBodyTypes.ListCompanyUsers.t(),
            reply: atom
          }
          | %ErrorResult{}
  def list(%{"company_id" => company_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/company/#{company_id}/users")
    |> Procore.send_request()
  end

  @doc """
  Creates users in a company.
  """
  @spec bulk_create(%{
          (company_id :: String.t()) => pos_integer,
          (users :: String.t()) => list
        }) :: %ResponseResult{} | %ErrorResult{}
  def bulk_create(%{
        "company_id" => company_id,
        "users" => users
      }) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/companies/#{company_id}/users/sync")
    |> Request.insert_body(%{"updates" => users})
    |> Procore.send_request()
  end
end
