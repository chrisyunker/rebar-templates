-module({{name}}).
-author('{{author_name}} <{{author_email}}>').

-behaviour(gen_fsm).

%% API
-export([start_link/1]).

%% gen_fsm callbacks
-export([init/1,
         handle_event/3,
         handle_sync_event/4,
         handle_info/3,
         terminate/3,
         code_change/4]).

-record(state, {}).

%% ===================================================================
%% API
%% ===================================================================
-spec start_link(term()) -> {ok, pid()}.
start_link(_Args) ->
    gen_fsm:start_link({local, ?MODULE}, ?MODULE, [], []).

%% ===================================================================
%% gen_fsm callbacks
%% ===================================================================
-spec init(list()) -> {ok, #state{}}.
init([]) ->
    {ok, #state{}}.

-spec handle_event(term(), atom(), #state{}) ->
    {next_state, atom(), #state{}}.
handle_event(_Event, StateName, State) ->
    {next_state, StateName, State}.

-spec handle_sync_event(term(), term(), atom(), #state{}) ->
    {reply, term(), atom(), #state{}}.
handle_sync_event(_Event, _From, StateName, State) ->
    Reply = ok,
    {reply, Reply, StateName, State}.

-spec handle_info(term(), atom(), #state{}) ->
    {next_state, atom(), #state{}}.
handle_info(_Info, StateName, State) ->
    {next_state, StateName, State}.

-spec terminate(term(), atom(), #state{}) -> ok.
terminate(_Reason, _StateName, _State) ->
    ok.

-spec code_change(term(), atom(), #state{}, term()) ->
    {ok, atom(), #state{}}.
code_change(_OldVersion, StateName, State, _Extra) ->
    {ok, StateName, State}.

%% ===================================================================
%% Private functions
%% ===================================================================

