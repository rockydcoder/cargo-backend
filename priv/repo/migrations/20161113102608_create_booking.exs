defmodule Cargo.Repo.Migrations.CreateBooking do
  use Ecto.Migration

  def change do
    create table (:bookings) do
      add :date_of_booking, :date
      add :date_of_shipment, :date
      add :vehicle_reg_no, :string
      add :merchant_reg_no, :string
    end
  end
end
