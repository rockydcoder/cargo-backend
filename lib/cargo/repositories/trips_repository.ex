defmodule Cargo.Repo.Trips do
  import Ecto.Query
  require Logger

  def selectTrip(params) do
    start_date = Ecto.DateTime.cast!(params[:startDate])
    query = from trip in Cargo.Trips,
      select: (
        %{ vehicle_reg_no: trip.vehicle_reg_no, incurred_cost: trip.incurred_cost, round_trip_cost: trip.round_trip_cost, price_charged: trip.price_charged, startDate: trip.start_date, endDate: trip.end_date }
      ),
      where: trip.end_date <= ^start_date,
      where: trip.end_date >= datetime_add(^Ecto.DateTime.utc, -1, "week"),
      where: trip.status == "AVAILABLE",
      where: trip.end_place == ^params[:endPlace],
      where: trip.vehicle_name in ^params[:vehicleNames]

    query |> Cargo.Repo.all
  end

  def selectPrecedingTripsPossible(params) do
     start_date = Ecto.DateTime.cast!(params[:startDate])
     query = from trip in Cargo.Trips,
        select: (
           %{ vehicleRegNo: trip.vehicle_reg_no, incurredCost: trip.incurred_cost, roundTripCost: trip.round_trip_cost, priceCharged: trip.price_charged, startDate: trip.start_date, endDate: trip.end_date }
        ),
        where: trip.end_date <= ^start_date,
        where: trip.end_date >= datetime_add(^Ecto.DateTime.utc, -1, "week"),
        where: trip.status == "AVAILABLE",
        where: trip.end_place == ^params[:startPlace],
        where: trip.vehicle_name in ^params[:vehicleNames]

     query |> Cargo.Repo.all
  end

  def addTrip(params) do
    Cargo.Repo.insert! %Cargo.Trips {
        start_date: Ecto.DateTime.cast!(params[:startDate]),
        end_date: Ecto.DateTime.cast!(params[:endDate]),
        start_place: params[:startPlace],
        end_place: params[:endPlace],
        vehicle_reg_no: params[:vehicleRegNo],
        status: params[:status],
        incurred_cost: params[:incurredCost],
        round_trip_cost: params[:roundTripCost],
        vehicle_name: params[:vehicleName],
        price_charged: params[:priceCharged]
    }
  end

end
