defmodule Cargo.Repo.Vehicles do
  alias Cargo.Repo
  import Ecto.Query
  require Logger

  def getVehicles do
    query = from vehicle in Cargo.Vehicle,
        select: (
            %{ driver_name: vehicle.driver_name, truck_name: vehicle.truck_name, base_location: vehicle.base_location, current_location: vehicle.current_location, reg_no: vehicle.reg_no }
        )
    query |> Cargo.Repo.all
  end

  def getVehicle(params) do
    query = from vehicle in Cargo.Vehicle,
        select: (
            %{ driver_name: vehicle.driver_name, truck_name: vehicle.truck_name, base_location: vehicle.base_location, current_location: vehicle.current_location, reg_no: vehicle.reg_no }
        )
    query |> Cargo.Repo.get(params[:id])
  end

  def getVehiclesByGenericField(params) do
    query = from vehicle in Cargo.Vehicle,
        select: (
            %{ driver_name: vehicle.driver_name, truck_name: vehicle.truck_name, base_location: vehicle.base_location, current_location: vehicle.current_location, reg_no: vehicle.reg_no }
        ),
        where: field(vehicle, ^String.to_existing_atom(params[:field_name])) == ^params[:field_value]
    query
    |> Cargo.Repo.all
  end

  def getVehiclesByMultipleFields(params) do
    conditions = params[:conditions]
    query = from vehicle in Cargo.Vehicle,
        select: (
            %{ driver_name: vehicle.driver_name, truck_name: vehicle.truck_name, base_location: vehicle.base_location, current_location: vehicle.current_location, reg_no: vehicle.reg_no }
        )
    query = applyCriteria(conditions, query)
    query |> Cargo.Repo.all
  end

  def applyCriteria([head | tail], query) do
    newQuery = from vehicle in query,
      where: field(vehicle, ^String.to_existing_atom(head.key)) == ^head.value
    applyCriteria(tail, newQuery)
  end

  def applyCriteria([], query) do
    query
  end

end
