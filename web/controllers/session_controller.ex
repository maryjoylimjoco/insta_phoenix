defmodule Insta.SessionController do
  use Insta.Web, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => user, "password" => pass}}) do
    case Insta.Auth.login_by_username_and_pass(conn, user, pass, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "welcome back!")
        |> redirect(to: post_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "invalid username/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Insta.Auth.logout()
    |> redirect(to: post_path(conn, :index))
  end
end
