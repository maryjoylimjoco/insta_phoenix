defmodule Insta.Post do
  use Insta.Web, :model

  schema "posts" do
    field :photo, :string
    field :caption, :string
    belongs_to :user, Insta.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:caption])
    |> validate_required([:caption])
  end
end
