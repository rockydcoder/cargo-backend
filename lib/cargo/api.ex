defmodule Cargo.Router.Homepage do
  use Maru.Router

  get do
    json(conn, %{ hello: :world })
  end
end

defmodule Cargo.API do
  use Maru.Router
  require Logger

  mount Cargo.Router.Homepage
  mount Cargo.Router.Vehicles
  mount Cargo.Router.Activities
  mount Cargo.Router.PriceChart
  mount Cargo.Router.Trips
  mount Cargo.Router.Merchants
  mount Cargo.Router.MerchantUsers

  before do
    plug Plug.Logger
    plug Plug.Parsers,
    pass: ["*/*"],
    json_decoder: Poison,
    parsers: [:json]

  end


  rescue_from Unauthorized, as: e do
        IO.inspect e
        conn
        |> put_status(401)
        |> json(%{message: "This place is not for you, you are unauthorized"})
    end

    rescue_from Maru.Exceptions.NotFound, as: e do
          Logger.debug "404: URL Not Found at path /#{e.path_info}"
          conn
          |> put_status(404)
          |> json(%{message: "Hey budy you have no idea where you want to go"})
    end

    rescue_from :all, as: e do
        IO.inspect e
        conn
        |> put_status(500)
        |> json(%{message: "Something went bad! And I do not know what..."})
    end
end
