-module(element_container).
-author('Scott Cowick').
-include("wf.hrl").
-compile(export_all).

reflect() -> record_info(fields, container).
render_element(Record) ->
  Tag = <<"div">>,
  Body = wf:render(Record#container.body),
  Mode = case Record#container.fluid of
           false -> "container";
           true -> "container-fluid"
         end,
  Class = case Record#container.class of
            undefined -> [Mode];
            C -> lists:append([Mode],C)
          end,
  Role = case Record#container.role of
           undefined -> undefined;
           R -> R
         end,
  Fields = [{<<"id">>,   Record#container.id},
    {<<"class">>, Class},
    {<<"style">>, Record#container.style},
    {<<"title">>, Record#container.title},
    {<<"role">>, Role}],
  Data = Record#container.data_fields,
  wf_tags:emit_tag(Tag, Body, lists:append([Fields, Data])).
