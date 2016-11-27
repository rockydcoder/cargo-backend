defmodule Cargo.Repo.Migrations.UpdatePartners do
  use Ecto.Migration

  def change do
    rename table(:partners), :name_of_company, to: :company_name
    rename table(:partners), :vehicles_registered, to: :fleet_size
  end
end
