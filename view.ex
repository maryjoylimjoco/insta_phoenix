defmodule Insta.View do
  use Phoenix.View, root: "web/templates"

  def csrf_toke(conn) do
    Map.get(conn.req_cookies,"_csrf_token")
  end
end
