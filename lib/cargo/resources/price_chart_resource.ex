defmodule Cargo.Router.PriceChart do
    use Maru.Router
    alias Cargo.Repo.PriceChart, as: DB
    require Logger


    namespace :price_chart do

        namespace :select do
            @desc "get price_chart for vehicles shortlisted based on vehicle name or lxbxh limit"
            params do
                optional :volume, type: Capacity
                optional :vehicleName, type: String
            end
            post do
                priceChart = DB.getPriceChartForShortlistedVehicles(params)
                priceChartMap = %{:result => priceChart}
                conn
                    |> put_status(200)
                    |> json(priceChartMap)
            end
        end

        namespace :new do
            @desc "add a new price_chart"
            params do
              requires :vehicleName, type: String
              requires :vehicleType, type: String
              requires :length, type: Float
              requires :breadth, type: Float
              requires :height, type: Float
              requires :pricePerKm, type: Float
              requires :stayChargePerHour, type: Float
              requires :capacity, type: Float
            end
            post do
              DB.addPriceChart(params)
              conn
              |> send_resp(201, "")
            end
        end
    end

end

