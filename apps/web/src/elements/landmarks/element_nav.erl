-module(element_nav).
-author('Scott Cowick').
-include("wf.hrl").
-compile(export_all).

reflect() -> record_info(fields, nav).
render_element(Record) ->
  Tag = <<"nav">>,
  Body = wf:render(Record#nav.body),
  Role = case Record#nav.role of
           undefined -> navigation;
           R -> R
         end,
  Fields = [{<<"id">>,   Record#nav.id},
    {<<"class">>, Record#nav.class},
    {<<"style">>, Record#nav.style},
    {<<"title">>, Record#nav.title},
    {<<"role">>, Role}],
  Data = Record#nav.data_fields,
  wf_tags:emit_tag(Tag, Body, lists:append([Fields, Data])).
