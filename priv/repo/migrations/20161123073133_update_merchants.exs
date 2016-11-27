defmodule Cargo.Repo.Migrations.UpdateMerchants do
  use Ecto.Migration

  def change do
    rename table(:merchants), :name_of_company, to: :company_name
  end
end
