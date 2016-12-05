defmodule Cargo do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: Cargo.Worker.start_link(arg1, arg2, arg3)
      # worker(Cargo.Worker, [arg1, arg2, arg3]),
      worker(Cargo.Repo, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Cargo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

defmodule Cargo.Activity do
  use Ecto.Schema

  @primary_key {:id, :integer, []}
  schema "activities" do
    field :date_of_pickup, Ecto.Date
    field :date_of_delivery, Ecto.Date
    field :status, :string
    field :pickup_location, :string
    field :drop_location, :string
    field :payment_ref_no, :string
  end
end

defmodule Cargo.Bookings do
  use Ecto.Schema

  @primary_key {:id, :integer, []}
  schema "bookings" do
    field :date_of_booking, Ecto.Date
    field :date_of_shipment, Ecto.Date
    field :vehicle_reg_no, :string
    field :merchant_reg_no, :string
  end
end

defmodule Cargo.Gps do
  use Ecto.Schema

  @primary_key {:sim_number, :string, []}
  schema "gps" do
    field :device_name, :string
    field :date_of_attachment, :string
  end
end

defmodule Cargo.Loyalty do
  use Ecto.Schema

  @primary_key {:id, :integer, []}
  schema "loyalties" do
    field :trip_no, :string
    field :coupon_used, :string
  end
end

defmodule Cargo.Merchants do
  use Ecto.Schema

  @primary_key{:licence_number, :string, []}
  schema "merchants" do
    field :company_name, :string
    field :merchant_name, :string
    field :contact_number, :string
  end
end

defmodule Cargo.MerchantUsers do
  use Ecto.Schema

  @primary_key{:id, :string, []}
  schema "merchants_users" do
    field :username, :string
    field :password, :string
    field :licence_number, :string
  end

end

defmodule Cargo.Partners do
  use Ecto.Schema

  @primary_key {:reg_no, :string, []}
  schema "partners" do
    field :company_name, :string
    field :contact_person_name, :string
    field :contact_person_number, :string
    field :fleet_size, :integer
  end
end

defmodule Cargo.Payments do
  use Ecto.Schema

  @primary_key{:payment_ref_no, :string, []}
  schema "payments" do
    field :payment_mode, :string
    field :payment_status, :string
    field :gross_amount, :float
    field :paid_amount, :float
    field :net_amount, :float
  end
end

defmodule Cargo.PriceChart do
    use Ecto.Schema

    @primary_key{:vehicle_name, :string, []}
    schema "price_chart" do
        field :vehicle_type, :string
        field :length, :float
        field :breadth, :float
        field :height, :float
        field :price_per_km, :float
        field :stay_charge_per_hour, :float
        field :capacity, :float
    end
end

defmodule Cargo.Transits do
  use Ecto.Schema

  @primary_key{:id, :string, []}
  schema "transits" do
    field :date, Ecto.Date
    field :place, :string
    field :status, :string
    field :vehicle_name, :string
  end
end

defmodule Cargo.Trips do
  use Ecto.Schema

  @primary_key {:id, :integer, []}
  schema "trips" do
    field :start_date, Ecto.DateTime
    field :end_date, Ecto.DateTime
    field :start_place, :string
    field :end_place, :string
    field :vehicle_reg_no, :string
    field :status, :string
    field :incurred_cost, :float
    field :round_trip_cost, :float
    field :vehicle_name, :string
    field :price_charged, :float
    field :exclusive_cost, :float
  end
end

defmodule Cargo.Vehicle do
  use Ecto.Schema

  @primary_key {:reg_no, :string, []}
  schema "vehicles" do
    field :driver_name, :string
    field :vehicle_name, :string
    field :base_location, :string
    field :current_location, :string
    field :scheduled_trips, :integer
  end
end