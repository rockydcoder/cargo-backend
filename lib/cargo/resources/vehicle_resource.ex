defmodule Cargo.Router.Vehicles do
  use Maru.Router
  alias Cargo.Repo.Vehicles, as: DB
  require Logger

  namespace :vehicles do

    @desc "get all vehicles"
    get do
      vehicles = DB.getVehicles
      conn
      |> put_status(200)
      |> json(vehicles)
    end

    route_param :id do
      @desc "get vehicle by id"
      get do
        vehicle = DB.getVehicle(params)
        conn
        |> put_status(200)
        |> json(vehicle)
      end
    end

    namespace :field do
      route_param :field_name do
        get do
          conn
          |> put_status(200)
          |> json(params)
        end
      end
    end

    @desc "get vehicle by field name"
    params do
      requires :field_name, type: String
      requires :field_value, type: String
    end
    post do
      vehicles = DB.getVehiclesByGenericField(params)
      conn
      |> put_status(200)
      |> json(vehicles)
    end
  end
end
