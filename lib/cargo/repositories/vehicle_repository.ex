defmodule Cargo.Repo.Vehicles do
  import Ecto.Query
  require Logger

  def getVehicles do
    query = from vehicle in Cargo.Vehicle,
    select: (
        %{ driver_name: vehicle.driver_name, vehicle_name: vehicle.vehicle_name, base_location: vehicle.base_location, current_location: vehicle.current_location, reg_no: vehicle.reg_no, scheduled_trips: vehicle.scheduled_trips }
    )
    query |> Cargo.Repo.all
  end

  def getVehicle(params) do
    query = from vehicle in Cargo.Vehicle,
    select: (
        %{ driver_name: vehicle.driver_name, vehicle_name: vehicle.vehicle_name, base_location: vehicle.base_location, current_location: vehicle.current_location, reg_no: vehicle.reg_no, scheduled_trips: vehicle.scheduled_trips }
    )
    query |> Cargo.Repo.get(params[:id])
  end

  def getVehiclesByGenericField(params) do
    query = from vehicle in Cargo.Vehicle,
    select: (
        %{ driver_name: vehicle.driver_name, vehicle_name: vehicle.vehicle_name, base_location: vehicle.base_location, current_location: vehicle.current_location, reg_no: vehicle.reg_no, scheduled_trips: vehicle.scheduled_trips }
    ),
    where: field(vehicle, ^String.to_existing_atom(params[:fieldName])) == ^params[:fieldValue]
    query
    |> Cargo.Repo.all
  end

  def getVehiclesByMultipleFields(params) do
    conditions = params[:conditions]
    query = from vehicle in Cargo.Vehicle,
    select: (
        %{ driver_name: vehicle.driver_name, vehicle_name: vehicle.vehicle_name, base_location: vehicle.base_location, current_location: vehicle.current_location, reg_no: vehicle.reg_no, scheduled_trips: vehicle.scheduled_trips }
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

  def selectVehicle(params) do
    query = from vehicle in Cargo.Vehicle,
        select: (
            %{regNo: vehicle.reg_no, base_location: vehicle.base_location, current_location: vehicle.current_location, driver_name: vehicle.driver_name, scheduled_trips: vehicle.scheduled_trips}
        ),
        where: vehicle.reg_no in ^params[:regNos]

    query |> Cargo.Repo.all
  end

  def addVehicle(params) do
    Cargo.Repo.insert! %Cargo.Vehicle {
        driver_name: params[:driver_name],
        vehicle_name: params[:vehicle_name],
        base_location: params[:base_location],
        current_location: params[:current_location],
        scheduled_trips: params[:scheduled_trips]
    }
  end
end
