defmodule Cargo.Repo.PriceChart do
    import Ecto.Query
    require Logger

    def getPriceChartForShortlistedVehicles(params) do
        query = from price_chart in Cargo.PriceChart,
            select: (
                %{vehicle_name: price_chart.vehicle_name, price_per_km: price_chart.price_per_km, stay_charge_per_hour: price_chart.stay_charge_per_hour}
            ),
            where: price_chart.length >= ^params[:length],
            where: price_chart.breadth >= ^params[:breadth],
            where: price_chart.height >= ^params[:height]
        query |> Cargo.Repo.all
    end

end
