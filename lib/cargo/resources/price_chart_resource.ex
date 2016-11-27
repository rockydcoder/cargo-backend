defmodule Cargo.Router.PriceChart do
    use Maru.Router
    alias Cargo.Repo.PriceChart, as: DB
    require Logger

    namespace :price_chart do

        @desc "get price_chart for vehicles shortlisted based on lxbxh limit"
        params do
          requires :length, type: Float
          requires :breadth, type: Float
          requires :height, type: Float
        end
        post do
            price_chart = DB.getPriceChartForShortlistedVehicles(params)
            conn
            |> put_status(200)
            |> json(price_chart)
        end
    end
end
