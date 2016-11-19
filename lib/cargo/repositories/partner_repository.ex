defmodule Cargo.Repo.Partners do
  alias Cargo.Repo
  import Ecto.Query
  require Logger

    def getPartners do
      query = from partner in Cargo.Partners,
      select: (
        %{ name_of_company: partner.name_of_company, contact_person_name: partner.contact_person_name, contact_person_number: partner.contact_person_number, vehicles_registered: partner.vehicles_registered, reg_no: partner.reg_no }
      )
      query
      |> Cargo.Repo.all
    end

    def getPartnersByGenericField(params) do
      query = from partner in Cargo.Partners,
          select: (
            %{ name_of_company: partner.name_of_company, contact_person_name: partner.contact_person_name, contact_person_number: partner.contact_person_number, vehicles_registered: partner.vehicles_registered, reg_no: partner.reg_no }
          ),
          where: field(partner, ^String.to_existing_atom(params[:field_name])) == ^params[:field_value]
      query
      |> Cargo.Repo.all
    end
end
