-module(element_main).
-author('Scott Cowick').
-include("wf.hrl").
-compile(export_all).

reflect() -> record_info(fields, main).
render_element(Record) ->
  Tag = <<"main">>,
  Body = wf:render(Record#main.body),
  Id = case Record#main.id of
         undefined -> main;
         M -> M
       end,
  Role = case Record#main.role of
           undefined -> main;
           R -> R
         end,
  Fields = [{<<"id">>,   Id},
    {<<"class">>, Record#main.class},
    {<<"style">>, Record#main.style},
    {<<"title">>, Record#main.title},
    {<<"role">>, Role}],
  Data = Record#main.data_fields,
  wf_tags:emit_tag(Tag, Body, lists:append([Fields, Data])).
