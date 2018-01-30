defmodule Procore.Resources.ProjectConfigurations do
  @moduledoc """
  Available requests for the project_configuration resource.
  """

  alias Procore.Resources.ProjectConfigurations.ResponseBodyTypes
  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Gets a project configuration.

  See `Procore.Resources.ProjectConfigurations.ResponseBodyTypes.GetProjectConfiguration.t/0` for response body.
  """
  @spec find(%{(project_id :: String.t()) => integer}) ::
          %ResponseResult{
            status_code: DefinedTypes.non_error_status_code(),
            parsed_body: ResponseBodyTypes.GetProjectConfiguration.t(),
            reply: atom
          }
          | %ErrorResult{}
  def find(%{"project_id" => _project_id} = params) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/project_configuration")
    |> Request.insert_query_params(params)
    |> Procore.make_request()
  end
end
