defmodule Cargo.Repo.Migrations.CreateTransits do
  use Ecto.Migration

  def change do
    create table(:transits) do
      add :date, :date
      add :place, :string
      add :status, :string
    end

  end
end
