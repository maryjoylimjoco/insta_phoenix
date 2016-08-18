defmodule Insta.PageController do
  use Insta.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
