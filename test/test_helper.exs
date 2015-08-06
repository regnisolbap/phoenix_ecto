defmodule Permalink do
  use Ecto.Schema

  embedded_schema do
    field :url
  end

  def changeset(model, params) do
    import Ecto.Changeset
    model
    |> cast(params, ~w(url), ~w())
    |> validate_length(:url, min: 3)
  end
end

defmodule Comment do
  use Ecto.Schema

  schema "comments" do
    field :body
  end

  def changeset(model, params) do
    import Ecto.Changeset
    model
    |> cast(params, ~w(body), ~w())
    |> validate_length(:body, min: 3)
  end
end

defmodule User do
  use Ecto.Schema

  schema "users" do
    field :name
    field :title
    field :age, :integer
    field :score, :decimal
    embeds_one :permalink, Permalink
    embeds_many :permalinks, Permalink
    has_one :comment, Comment
    has_many :comments, Comment
  end
end

ExUnit.start()
