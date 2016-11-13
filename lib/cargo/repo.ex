defmodule Cargo.Repo do
  use Ecto.Repo, otp_app: :cargo
  import Ecto.Query

    def getVehicles do
      query = from vehicle in Cargo.Vehicle,
          select: (
              %{ driver_name: vehicle.driver_name, truck_name: vehicle.truck_name, base_location: vehicle.base_location}
          )
      query |> Cargo.Repo.all
    end

end
