-module(element_col).
-author('Scott Cowick').
-include("wf.hrl").
-compile(export_all).

reflect() -> record_info(fields, col).
render_element(Record) ->
  Tag = <<"div">>,
  Body = Record#col.body,
  XS = lists:flatten(io_lib:format("col-xs-~p", [Record#col.xs])),
  SM = case Record#col.sm of
         undefined -> [];
         _ -> lists:flatten(io_lib:format("col-sm-~p", [Record#col.sm]))
       end,
  MD = case Record#col.md of
         undefined -> [];
         _ -> lists:flatten(io_lib:format("col-md-~p", [Record#col.md]))
       end,
  LG = case Record#col.lg of
         undefined -> [];
         _ -> lists:flatten(io_lib:format("col-lg-~p", [Record#col.lg]))
       end,
  Class = lists:append([XS, SM, MD, LG], Record#col.class),
  Fields = [{<<"id">>, Record#col.id},
            {<<"class">>, Class},
            {<<"style">>, Record#col.style},
            {<<"role">>, Record#col.role},
            {<<"title">>, Record#col.title}],
  Data = Record#col.data_fields,
  wf_tags:emit_tag(Tag, wf:render(Body), lists:append([Fields, Data])).