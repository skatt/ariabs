-module(element_button).
-author('Scott Cowick').
-include_lib("wf.hrl").
-compile(export_all).

reflect() -> record_info(fields, button).

render_element(Record) ->
  Tag = <<"button">>,
  Body = Record#button.body,
  Id = case Record#button.id of
         undefined -> wf:temp_id();
         I -> I
       end,
  %Theme = case Record#button.theme of
   %         _ -> "btn-default"
    %      end,
  Class = Record#button.class,
  Toggle = case Record#button.toggle of
             undefined -> undefined;
             [T] -> [[T]];
              T -> [T]
           end,
  Canvas = case Record#button.canvas of
             undefined -> undefined;
             [C] -> [[C]];
             C -> C
           end,
  Disabled = if Record#button.disabled == true -> "disabled"; true -> undefined end,
  Fields = [{<<"id">>, Id},
            {<<"type">>, Record#button.type},
            {<<"name">>, Record#button.name},
            {<<"class">>, Class},
            {<<"style">>, Record#button.style},
            {<<"data-target">>, Record#button.target},
            {<<"data-toggle">>, Toggle},
            {<<"data-canvas">>, Canvas},
            {<<"disabled">>, Disabled },
            {<<"value">>, Record#button.value}],
  Data = Record#button.data_fields,
  Event = case Record#button.postback of
            undefined -> [];
            Postback -> wf:wire(#event{type=click, postback=Postback, target=Id,
              source=Record#button.source, delegate=Record#button.delegate })
          end,
  Event, wf_tags:emit_tag(Tag, wf:render(Body), lists:append([Fields, Data])).