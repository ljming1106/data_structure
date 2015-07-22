%%%-------------------------------------------------------------------
%%% @author lijianming
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 七月 2015 下午4:43
%%%-------------------------------------------------------------------
-module(heap).
-author("lijianming").

%% API
-export([add/1, get/0]).

add(Data) ->
    case erlang:get(?MODULE) of
        {Num, List} when is_list(List) andalso List =/=[]  ->
            erlang:put(?MODULE, {Num + 1, [Data | List]});
        _ ->
            erlang:put(?MODULE, {1, [Data]})
    end,
    ok.

get() ->
    case erlang:get(?MODULE) of
        {Num, List} when is_list(List) andalso List =/=[]  ->
            Data = lists:last(List),
            List1 = lists:sublist(List, Num - 1),
            erlang:put(?MODULE, {Num - 1, List1}),
            Data;
        _ ->
            io:fwrite("the heap is null!~n", [])
    end.

