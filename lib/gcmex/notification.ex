defmodule GcmEx.Notification do
  @derive [Poison.Encoder]

  @moduledoc """
  Notification payload

  ## Reference
  https://developers.google.com/cloud-messaging/http-server-ref#notification-payload-support
  """
  defstruct [
    :title,
    :body,
    :icon,
    :sound,
    :badge,
    :tag,
    :color,
    :click_action,
    :body_loc_key,
    :body_loc_args,
    :title_loc_key,
    :title_loc_args
  ]

  @type t :: %__MODULE__{}
end
