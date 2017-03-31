defmodule DbProxyIssue.TestCase do
  @moduledoc false

  use ExUnit.CaseTemplate

  using do
    quote do
      alias DbProxyIssue.Repo

      import Ecto
      import Ecto.{Changeset, Query}
      import DbProxyIssue.TestCase
    end
  end

  setup _tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(DbProxyIssue.Repo)

    # Alway share the connection we just checked out with all other processes
    # MySQL does not support concurrent tests
    Ecto.Adapters.SQL.Sandbox.mode(DbProxyIssue.Repo, {:shared, self()})

    :ok
  end
end
