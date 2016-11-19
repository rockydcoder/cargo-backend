defmodule Cargo.Repo.Migrations.CreatePartner do
  use Ecto.Migration

  def change do
    create table(:partners, primary_key: false) do
      add :name_of_company, :string
      add :contact_person_name, :string
      add :contact_person_number, :string
      add :vehicles_registered, :integer
      add :reg_no, :string, primary_key: true
    end
  end
end
