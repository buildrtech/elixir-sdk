defmodule Tesla.Middleware.OAuth do
  @behaviour Tesla.Middleware

  defp procore_host(), do: Application.get_env(:procore, :host, "https://api.procore.com")
  defp client_id(), do: Application.get_env(:procore, :client_id)
  defp client_secret(), do: Application.get_env(:procore, :client_secret)

  def call(env, next, _options) do
    env
    |> add_auth_header()
    |> Tesla.run(next)
  end

  defp add_auth_header(env) do
    %{env | headers: [{"Authorization", "Bearer #{get_access_token()}"} | env.headers]}
  end

  defp get_access_token do
    case Cachex.get(:token_cache, :access_token) do
      {:ok, nil} ->
        %{"access_token" => token, "expires_in" => expires_in} =
          Tesla.post!(tesla_client(), oauth_url(), oauth_request_body()).body |> Poison.decode!()

        Cachex.put(:token_cache, :access_token, token, ttl: :timer.seconds(expires_in - 1000))
        token

      {:ok, oauth_token} ->
        oauth_token
    end
  end

  def tesla_client do
    Tesla.build_client([
      {Tesla.Middleware.Headers, headers()},
      {Tesla.Middleware.EncodeJson, [engine: Poison]}
    ])
  end

  def headers do
    [{"Content-type", "application/json"}, {"Accept", "application/json"}]
  end

  def oauth_url do
    procore_host() <> "/oauth/token"
  end

  def oauth_request_body do
    %{client_id: client_id(), client_secret: client_secret(), grant_type: "client_credentials"}
  end
end
