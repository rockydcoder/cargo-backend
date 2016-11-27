defmodule Cargo.Router.Trips do
  use Maru.Router
  alias Cargo.Repo.Trips, as: DB
  require Logger

  namespace :trips do

    namespace :select do
        namespace :preceding do
            @desc "select list of possible preceding trips"
            params do
              requires :startPlace, type: String
              requires :startDate, type: String
              requires :vehicleNames, type: List[String]
            end
        end

        @desc "select a trip"
        params do
          requires :startDate, type: String
          requires :endPlace, type: String
          requires :vehicleNames, type: List[String]
        end
        post do
          trips = DB.selectTrip(params)
          conn
          |> put_status(200)
          |> json(trips)
        end
    end

    namespace :new do
        @desc "add a trip"
        params do
            requires :startDate, type: String
            requires :endDate, type: String
            requires :startPlace, type: String
            requires :endPlace, type: String
            requires :vehicleRegNo, type: String
            requires :status, type: String
            requires :incurredCost, type: Float
            requires :roundTripCost, type: Float
            requires :vehicleName, type: String
            requires :priceCharged, type: Float
        end
        post do
            DB.addTrip(params)
            conn
            |> send_resp(201, "")
        end
    end

  end

end
