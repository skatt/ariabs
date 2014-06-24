-module(element_menu).
-author('Scott Cowick').
-include("wf.hrl").
-compile(export_all).

reflect() -> record_info(fields, menu).

render_element(Record) ->
  Tag = <<"ul">>,
  Body = Record#menu.body,
  Role =
  Fields = [{<<"id">>, Record#menu.id},
            {<<"class">>, lists:append([], Record#menu.class)},
            {<<"style">>, Record#menu.style},
            {<<"role">>, menu},
            {<<"title">>, Record#menu.title}],
  Data = Record#menu.data_fields,
  wf_tags:emit_tag(Tag, wf:render(Body), lists:append([Fields, Data])).