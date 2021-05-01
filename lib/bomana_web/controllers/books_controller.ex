defmodule BomanaWeb.BooksController do
  alias Bomana.Book
  alias Bomana.Books.Create

  use BomanaWeb, :controller

  def create(conn, params) do
    with {:ok, %Book{} = book} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render("create.json", book: book)
    end
  end
end
