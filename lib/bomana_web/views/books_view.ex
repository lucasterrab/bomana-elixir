defmodule BomanaWeb.BooksView do
  use BomanaWeb, :view

  def render("create.json", %{book: book}) do
    %{
      message: "Book created!",
      book: book
    }
  end
end
