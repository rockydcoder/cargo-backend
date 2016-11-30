defmodule Cargo.Repo.PriceChart do
    import Ecto.Query
    require Logger

    def getPriceChartForShortlistedVehicles(params) do
        capacityJson = Poison.Encoder.encode(params[:capacity], [])
        volume = Poison.decode!(~s(#{capacityJson}), as: %Volume{})
        Logger.error "volume:"
        query = from price_chart in Cargo.PriceChart,
            select: (
                %{vehicleName: price_chart.vehicle_name}
            ),
            where: (price_chart.length >= ^(volume.length) and price_chart.breadth >= ^(volume.breadth) and price_chart.height >= ^(volume.height) or price_chart.vehicle_name == ^params[:vehicleName])
        query |> Cargo.Repo.all
    end

    def addPriceChart(params) do
        Cargo.Repo.insert! %Cargo.PriceChart {
            vehicle_name: params[:vehicleName],
            vehicle_type: params[:vehicleType],
            length: params[:length],
            breadth: params[:breadth],
            height: params[:height]
        }
    end



end
