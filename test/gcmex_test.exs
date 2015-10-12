defmodule Bakisto.GCMTest do
  use ExUnit.Case

  alias GcmEx
  alias GcmEx.Message

  test "send to GSM" do
    defmodule HTTPtest do
      def post(path, data, headers) do
        assert path == "https://gcm-http.googleapis.com/gcm/send"
        assert data == "{\"to\":\"user1\",\"time_to_live\":null,\"restricted_package_name\":null,\"registration_ids\":null,\"priority\":null,\"notification\":null,\"dry_run\":null,\"delay_while_idle\":null,\"data\":null,\"content_available\":null,\"collapse_key\":null}"
        assert headers == [{"Content-Type", "application/json"}, {"Authorization", "key=xxxtestxxx"}]
        {:ok, %HTTPoison.Response{status_code: 200, body: "{\"multicast_id\":7392464421346996000,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1442091036154095%251338c2f9fd7ecd\"}]}"}}
      end
    end

    {:ok, response} = GcmEx.send(%Message{to: "user1"}, HTTPtest)
    assert 7392464421346996000 == response.multicast_id
    assert List.first(response.results)["message_id"] == "0:1442091036154095%251338c2f9fd7ecd"
  end
end
