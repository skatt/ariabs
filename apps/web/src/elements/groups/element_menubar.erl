-module(element_menubar).
-author('Scott Cowick').
-include("wf.hrl").
-compile(export_all).

reflect() -> record_info(fields, menubar).
render_element(Record) ->
  Tag = <<"ul">>,
  Body = Record#menubar.body,
  Role = case Record#menubar.role of
           undefined -> menubar;
           R -> R
         end,
  Controls = case Record#menubar.control_id of
               undefined -> undefined;
               D -> lists:flatten("#",atom_to_list(D))
             end,
  Fields = [{<<"id">>, Record#menubar.id},
            {<<"class">>, Record#menubar.class},
            {<<"style">>, Record#menubar.style},
            {<<"title">>, Record#menubar.title},
            {<<"role">>, Role},
            {<<"aria-controls">>, Controls}],
  Data = Record#menubar.data_fields,
  wf_tags:emit_tag(Tag, wf:render(Body), lists:append([Fields, Data])).
