-module(element_row).
-author('Scott Cowick').
-include("wf.hrl").
-compile(export_all).


reflect() -> record_info(fields, row).

render_element(Record) ->
  Tag = <<"div">>,
  Body = Record#row.body,
  Fields = [{<<"id">>, Record#row.id},
    {<<"class">>, lists:append(["row"], Record#row.class)},
    {<<"style">>, Record#row.style},
    {<<"role">>, Record#row.role},
    {<<"title">>, Record#row.title}],
  Data = Record#row.data_fields,
  wf_tags:emit_tag(Tag, wf:render(Body), lists:append([Fields,Data])).