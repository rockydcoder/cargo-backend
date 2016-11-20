defmodule Cargo.Repo.Trips do
  alias Cargo.Repo
  import Ecto.Query
  require Logger

  def getOpenVehicles(params) do
    query = from trip in Cargo.Trips,
      select: (
        %{ vehicle_reg_no: trip.vehicle_reg_no, incurred_cost: trip.incurred_cost, round_trip_cost: trip.round_trip_cost }
      ),
      where: trip.end_date <= ^params[:start_date] or trip.end_date <= ^params[:end_date],
      where: trip.status == "completed",
      where: trip.end_place == ^params[:end_place]

    query |> Cargo.Repo.all
  end

end
