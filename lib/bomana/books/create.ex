defmodule Bomana.Books.Create do
  alias Bomana.{Book, Repo}

  def call(params) do
    params
    |> Book.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Book{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
