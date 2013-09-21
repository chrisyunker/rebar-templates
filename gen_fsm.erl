-module({{name}}).
-author('{{author_name}} <{{author_email}}>').

-behaviour(gen_fsm).

-export([init/1,
         handle_info/3,
         handle_event/3,
         handle_sync_event/4,
         terminate/3,
         code_change/4]).
-export([start_link/1]).

%% ===================================================================
%% API
%% ===================================================================
start_link(_Args) ->
    gen_fsm:start_link({local, ?MODULE}, ?MODULE, [], []).

%% ===================================================================
%% gen_fsm callbacks
%% ===================================================================
init([]) ->
    {ok, state}.

handle_info(_Info, StateName, State) ->
    {next_state, StateName, State}.

handle_event(_Event, StateName, State) ->
    {next_state, StateName, State}.

handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    {noreply, Reply, StateName, State}.

terminate(_Reason, _StateName, _State) ->
    ok.

code_change(_OldVersion, StateName, State, _Extra) ->
    {ok, StateName, State}.

