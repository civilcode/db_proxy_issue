# DbProxyIssue

Application with one GenServer doing calls to the database in synchronous mode.

See post on [ElixirForum](https://elixirforum.com/t/issue-with-dbconnection-ownership-proxy-checkout-and-genserver-process/4334).

## Installation

```
mix deps.get
mix test
```

## How to reproduce the issue

Just keep running the test.  Eventually, you should be getting a `GenServer` error like this one:

```
12:25:35.584 [error] GenServer DbProxyIssue.Worker terminating
** (stop) exited in: GenServer.call(#PID<0.197.0>, {:checkout, #Reference<0.0.2.1622>, true, 15000}, 5000)
    ** (EXIT) shutdown: "owner #PID<0.196.0> exited with: shutdown"
    (db_connection) lib/db_connection/ownership/proxy.ex:32: DBConnection.Ownership.Proxy.checkout/2
```

If you set the `pool_size` to `1` in `config/test.exs`, the error is not reproduceable.
