defmodule Cargo.Repo.Vehicles do
  import Ecto.Query
  require Logger

  def getVehicles do
    query = from vehicle in Cargo.Vehicle,
    select: (
        %{ driverName: vehicle.driver_name, vehicleName: vehicle.vehicle_name, baseLocation: vehicle.base_location, currentLocation: vehicle.current_location, regNo: vehicle.reg_no, scheduledTrips: vehicle.scheduled_trips }
    )
    query |> Cargo.Repo.all
  end

  def getVehicle(params) do
    query = from vehicle in Cargo.Vehicle,
    select: (
        %{ driverName: vehicle.driver_name, vehicleName: vehicle.vehicle_name, baseLocation: vehicle.base_location, currentLocation: vehicle.current_location, regNo: vehicle.reg_no, scheduledTrips: vehicle.scheduled_trips }
    )
    query |> Cargo.Repo.get(params[:id])
  end

  def getVehiclesByGenericField(params) do
    query = from vehicle in Cargo.Vehicle,
    select: (
        %{ driver_name: vehicle.driver_name, vehicleName: vehicle.vehicle_name, baseLocation: vehicle.base_location, currentLocation: vehicle.current_location, regNo: vehicle.reg_no, scheduledTrips: vehicle.scheduled_trips }
    ),
    where: field(vehicle, ^String.to_existing_atom(params[:fieldName])) == ^params[:fieldValue]
    query
    |> Cargo.Repo.all
  end

  def getVehiclesByMultipleFields(params) do
    conditions = params[:conditions]
    query = from vehicle in Cargo.Vehicle,
    select: (
        %{ driverName: vehicle.driver_name, vehicleName: vehicle.vehicle_name, baseLocation: vehicle.base_location, currentLocation: vehicle.current_location, regNo: vehicle.reg_no, scheduledTrips: vehicle.scheduled_trips }
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
            %{regNo: vehicle.reg_no, baseLocation: vehicle.base_location, currentLocation: vehicle.current_location, driverName: vehicle.driver_name, scheduledTrips: vehicle.scheduled_trips}
        ),
        where: vehicle.reg_no in ^params[:regNos]

    query |> Cargo.Repo.all
  end

  def addVehicle(params) do
    Cargo.Repo.insert! %Cargo.Vehicle {
        reg_no: params[:regNo],
        driver_name: params[:driverName],
        vehicle_name: params[:vehicleName],
        base_location: params[:baseLocation],
        current_location: params[:currentLocation],
        scheduled_trips: params[:scheduledTrips]
    }
  end

  def fetchVehicleCount(params) do
    # Aligned to Rules Version 1 - I#1
     query = from vehicle in Cargo.Vehicle,
     select: (
        count(vehicle.reg_no)
     ),
     where: field(vehicle, :reg_no) == ^params.vehicleRegNo,
     where: field(vehicle, :scheduled_trips) == ^params.tripNo
    query |> Cargo.Repo.all
  end

end
