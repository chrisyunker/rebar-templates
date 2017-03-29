-module({{name}}).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%%====================================================================
%% API functions
%%====================================================================
-spec start_link() -> {ok, pid()}.
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================
-spec init([]) ->
    {ok, {supervisor:sup_flags(), [supervisor:child_spec()]}}.
init([]) ->
    SupFlags = #{strategy => one_for_all,
                 intensity => 0,
                 period => 1},
    Child = #{id => module,
              start => {module, start_link, []},
              restart => permanent,
              shutdown => brutal_kill,
              type => worker,
              modules => [module]},
    {ok, {SupFlags, [Child]}}.

%%====================================================================
%% Internal functions
%%====================================================================
