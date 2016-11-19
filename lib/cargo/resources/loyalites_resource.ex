defmodule Cargo.Router.Loyalties do
  use Maru.Router
  alias Cargo.Repo.Loyalties, as: DB
  require Logger

  namespace :loyalties do

    @desc "get all loyalties"
    get do
      loyalties = DB.getLoyalties
      conn
      |> put_status(200)
      |> json(loyalties)
    end
  end

end
