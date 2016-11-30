defmodule Cargo.Router.Vehicles do
  use Maru.Router
  alias Cargo.Repo.Vehicles, as: DB
  require Logger

  namespace :vehicles do

    namespace :select do
        @desc "select vehicle based on param values"
        params do
            requires :regNos, type: List[String]
        end
        post do
            vehicles = DB.selectVehicle(params)
            vehicleMap = %{:results => vehicles}
            conn
            |> put_status(200)
            |> json(vehicleMap)
        end
    end

    namespace :new do
        @desc "add a new vehicle"
          params do
            requires :vehicleName, type: String
            requires :driverName, type: String
            requires :baseLocation, type: String
            requires :currentLocation, type: String
            requires :scheduledTrips, type: String
          end
          post do
            DB.addVehicle(params)
            conn
            |> send_resp(201, "")
          end
    end

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

    @desc "get vehicle by applying multiple conditions"
    params do
      requires :conditions, type: List do
        requires :key, type: String
        requires :value, type: String
      end
    end
    post do
      vehicles = DB.getVehiclesByMultipleFields(params)
      conn
      |> put_status(200)
      |> json(vehicles)
    end

  end
end
