-module(cyrsasl_scram_sha256_plus).

-export([mechanism/0, mech_new/3, mech_step/2]).

-behaviour(cyrsasl).

-spec mechanism() -> cyrsasl:mechanism().
mechanism() ->
    <<"SCRAM-SHA-256-PLUS">>.

mech_new(Host, Creds, #{} = SocketData) ->
    cyrsasl_scram:mech_new(Host, Creds, SocketData#{sha => sha256, scram_plus => true}).

mech_step(State, ClientIn) ->
    cyrsasl_scram:mech_step(State, ClientIn).
