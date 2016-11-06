defmodule Cargo.Router.Homepage do
  use Maru.Router

  get do
    json(conn, %{ hello: :world })
  end
end

defmodule Cargo.API do
  use Maru.Router

  mount Cargo.Router.Homepage

  rescue_from :all do
    conn
    |> put_status(500)
    |> text("Server Error")
  end
end
