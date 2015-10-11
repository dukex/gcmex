defmodule GcmEx.Notification do
  @derive [Poison.Encoder]
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
end
