defmodule GcmEx.Message do
  @derive [Poison.Encoder]

  @moduledoc """
  Message payload

  ## Reference
  https://developers.google.com/cloud-messaging/http-server-ref#downstream-http-messages-json
  """
  defstruct [
    # targets
    :to,
    :registration_ids,

    # options
    :collapse_key,
    :priority,
    :content_available,
    :delay_while_idle,
    :time_to_live,
    :restricted_package_name,
    :dry_run,

    # payload
    :data,
    :notification
  ]

  @type t :: %__MODULE__{}
end
