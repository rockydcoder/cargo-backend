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

defmodule Cargo.Vehicle do
  use Ecto.Schema

  schema "vehicle" do
    field :driver_name, :string
    field :truck_name, :string
    field :base_location, :string
    field :current_location, :string
    field :reg_no, :string
  end
end

defmodule Cargo.Activity do
  use Ecto.Schema

  schema "activity" do
    field :date_of_pickup, Ecto.Date
    field :date_of_delivery, Ecto.Date
    field :status, :string
    field :pickup_location, :string
    field :drop_location, :string
    field :payment_mode, :string
    field :payment_status, :string
    field :payment_ref_no, :string
    field :gross_amount, :float
    field :paid_amount, :float
    field :net_amount, :float
  end
end

defmodule Cargo.Loyalty do
  use Ecto.Schema

  schema "loyalties" do
    field :trip_no, :string
    field :coupon_used, :string
  end
end

defmodule Cargo.Partners do
  use Ecto.Schema

  schema "partners" do
    field :name_of_company, :string
    field :contact_person_name, :string
    field :contact_person_number, :string
    field :vehicles_registered, :integer
    field :reg_no, :string
  end
end

defmodule Cargo.Gps do
  use Ecto.Schema

  schema "gps" do
    field :device_name, :string
    field :date_of_attachment, :string
    field :sim_number, :string
  end
end

defmodule Cargo.Bookings do
  use Ecto.Schema

  schema "bookings" do
    field :date_of_booking, Ecto.Date
    field :date_of_shipment, Ecto.Date
    field :vehicle_reg_no, :string
    field :merchant_reg_no, :string
  end

end
