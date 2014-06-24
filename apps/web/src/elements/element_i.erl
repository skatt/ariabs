-module(element_i).
-author('Scott Cowick').
-include("wf.hrl").
-compile(export_all).

reflect() -> record_info(fields, i).

render_element(Record) ->
  Tag = <<"i">>,
  Body = Record#i.body,
  Icon = case Record#i.icon of
           undefined -> [];
           I -> ["fa", lists:flatten("fa-", I)]
         end,
  Fields = [{<<"id">>, Record#i.id},
    {<<"class">>, lists:append(Icon, Record#i.class)},
    {<<"style">>, Record#i.style},
    {<<"role">>, Record#i.role},
    {<<"title">>, Record#i.title}],
  Data = Record#i.data_fields,
  wf_tags:emit_tag(Tag, wf:render(Body), lists:append([Fields, Data])).