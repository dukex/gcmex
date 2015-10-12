defmodule GcmEx do
  @endpoint "https://gcm-http.googleapis.com"

  alias GcmEx.Message

  @doc """
  Send message to target(s)

  To see more information about the acceptable fields see

  https://developers.google.com/cloud-messaging/http-server-ref#send-downstream

  ## Examples
      target = ["APA91bHun4MxP5egoKMwt2KZFBaFUH-1RYqx..."]
      message = %GcmEx.Message{
        to: target,
        notification: %GcmEx.Notification{
          title: "Germany x Brazil",
          body: "Goool",
        },
        data: %{
          score: "7x1",
          time: "79'"
        },
        priority: "high"
      }
      GcmEx.send(message)
  """
  def send(message = %Message{}, http \\ HTTPoison) do
    post(http, "/gcm/send", Poison.encode!(message), Application.get_env(:gcmex, :api_key))
  end

  defp post(http, path, data, key) do
    headers = [
      {"Content-Type", "application/json"},
      {"Authorization", "key=" <> key}
    ]
    case http.post process_url(path), data, headers do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, process_response_body(body)}
      _ -> {:error}
    end
  end

  defp process_url(path) do
    @endpoint <> path
  end

  defp process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.reduce(%{}, fn {k, v}, map -> Dict.put(map, String.to_atom(k), v) end)
  end
end
