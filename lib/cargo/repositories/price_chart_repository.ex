defmodule Cargo.Repo.PriceChart do
    import Ecto.Query
    require Logger
    use Maru.Helper

    def getPriceChartForShortlistedVehicles(params) do
        selectPriceChartFromVolume(fetchRequiredVolume(params))
    end

    def addPriceChart(params) do
        Cargo.Repo.insert! %Cargo.PriceChart {
            vehicle_name: params[:vehicleName],
            vehicle_type: params[:vehicleType],
            length: params[:length],
            breadth: params[:breadth],
            height: params[:height],
            price_per_km: params[:pricePerKm],
            stay_charge_per_hour: params[:stayChargePerHour],
            capacity: params[:capacity]
        }
    end

    defp fetchRequiredVolume(params) do
        capacityJson =
        if (Map.has_key?(params, :volume)) do
            Poison.Encoder.encode(params[:volume], [])
        else
            priceChartResult = fetchPriceChart(params)
            priceChartAsJson = Poison.Encoder.encode(List.first(priceChartResult), [])
            priceChart = Poison.decode!(~s(#{priceChartAsJson}), as: %PriceChart{})

            ~s({"length": #{priceChart.length}, "breadth": #{priceChart.breadth}, "height": #{priceChart.height}})
        end

        Poison.decode!(~s(#{capacityJson}), as: %Volume{})
    end

    defp selectPriceChartFromVolume(volume) do
        query = from price_chart in Cargo.PriceChart,
            select: (
                %{vehicleName: price_chart.vehicle_name, vehicleType: price_chart.vehicle_type, length: price_chart.length, breadth: price_chart.breadth, height: price_chart.height, pricePerKm: price_chart.price_per_km, stayChargePerHour: price_chart.stay_charge_per_hour}
            ),
                where: (price_chart.length >= ^(volume.length) and price_chart.breadth >= ^(volume.breadth) and price_chart.height >= ^(volume.height))
        query |> Cargo.Repo.all
    end


    defp fetchPriceChart(params) do
        query = from price_chart in Cargo.PriceChart,
            select: (
                 %{vehicleName: price_chart.vehicle_name, vehicleType: price_chart.vehicle_type, length: price_chart.length, breadth: price_chart.breadth, height: price_chart.height}
            ),
                 where: price_chart.vehicle_name == ^params[:vehicleName]
        query |> Cargo.Repo.all
    end
end
