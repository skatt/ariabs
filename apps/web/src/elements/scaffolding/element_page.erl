-module(element_page).
-author('Scott Cowick').
-include("wf.hrl").
-compile(export_all).

reflect() -> record_info(fields, page).
render_element(Record) ->
  Id = case Record#page.id of
         undefined -> page;
         I -> I
       end,
  Tag = <<"div">>,
  Body = wf:render(Record#page.body),
  Mode = case Record#page.mode of
           fitted -> "page-fitted";
           _ -> "page"
         end,
  Scroll = case Record#page.scroll of
           true -> [];
           false -> "noscroll"
         end,
  Class = case Record#page.class of
            undefined -> [Mode, Scroll];
            C -> lists:append([Mode, Scroll],C)
          end,
  Role = case Record#page.role of
           undefined -> undefined;
           R -> R
         end,
  Fields = [{<<"id">>,   Id},
            {<<"class">>, Class},
            {<<"style">>, Record#page.style},
            {<<"title">>, Record#page.title},
            {<<"role">>, Role}],
  Data = Record#page.data_fields,
  wf_tags:emit_tag(Tag, Body, lists:append([Fields, Data])).