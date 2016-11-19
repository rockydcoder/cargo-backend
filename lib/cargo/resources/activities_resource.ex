defmodule Cargo.Router.Activities do
  use Maru.Router
  alias Cargo.Repo.Activities, as: DB
  require Logger

  namespace :activities do

    @desc "get all activities"
    get do
      activites = DB.getActivities
      conn
      |> put_status(200)
      |> json(activites)
    end
  end
end
