defmodule Bomana.Book do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:title, :author, :rating]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "books" do
    field :title, :string
    field :author, :string
    field :rating, :integer

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:title, min: 2)
    |> validate_length(:author, min: 2)
  end
end
