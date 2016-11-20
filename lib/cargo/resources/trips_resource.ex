defmodule Cargo.Router.Trips do
  use Maru.Router
  alias Cargo.Repo.Trips, as: DB
  require Logger

  namespace :trips do

    @desc "get vehicles suited to trip"
    params do
      requires :start_date, type: String
      requires :end_date, type: String
      requires :pickup_location, type: String
    end
    post do
      vehicles = DB.getOpenVehicles(params)
      conn
      |> put_status(200)
      |> json(vehicles)
    end

  end

end
