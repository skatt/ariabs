-module(element_footer).
-author('Scott Cowick').
-include("wf.hrl").
-compile(export_all).

reflect() -> record_info(fields, footer).
render_element(Record) ->
  Tag = <<"footer">>,
  Body = wf:render(Record#footer.body),
  Role = case Record#footer.role of
           undefined -> banner;
           R -> R
         end,
  Fields = [{<<"id">>,   Record#footer.id},
    {<<"class">>, Record#footer.class},
    {<<"style">>, Record#footer.style},
    {<<"title">>, Record#footer.title},
    {<<"role">>, Role}],
  Data = Record#footer.data_fields,
  wf_tags:emit_tag(Tag, Body, lists:append([Fields, Data])).
