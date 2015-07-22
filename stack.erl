%%%-------------------------------------------------------------------
%%% @author lijianming
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 六月 2015 下午3:03
%%%-------------------------------------------------------------------
-module(stack).
-author("lijianming").

%% API
-export([push/1, pop/0]).

push(Data) ->
    case erlang:get(?MODULE) of
        [_ | _] = List ->
            erlang:put(?MODULE, [Data | List]);
        _ ->
            erlang:put(?MODULE, [Data])
    end,
    ok.

pop() ->
    case erlang:get(?MODULE) of
        [Data | List] ->
            erlang:put(?MODULE, List),
            Data;
        _ ->
            io:fwrite("the stack is null!~n", [])
    end.
