defmodule Cargo.Repo.Migrations.CreateGps do
  use Ecto.Migration

  def change do
    create table(:gps, primary_key: false) do
      add :device_name, :string
      add :date_of_attachment, :string
      add :sim_number, :string, primary_key: true
    end
  end
end
