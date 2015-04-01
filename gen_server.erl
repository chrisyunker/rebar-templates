-module({{name}}).
-author('{{author_name}} <{{author_email}}>').

-behaviour(gen_server).

%% API
-export([start_link/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-record(state, {}).

%% ===================================================================
%% API
%% ===================================================================
start_link(_Args) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

%% ===================================================================
%% gen_server callbacks
%% ===================================================================
init([]) ->
    {ok, #state{}}.

handle_call(_Message, _From, State) ->
    Response = ok,
    {reply, Response, State}.

handle_cast(_Message, State) ->
    {noreply, State}.

handle_info(_Message, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVersion, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Private functions
%%%===================================================================

