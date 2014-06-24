-module(element_menuitem).
-author('Scott Cowick').
-include("wf.hrl").
-compile(export_all).

reflect() -> record_info(fields, menuitem).
render_element(Record) ->
  Tag = case Record#menuitem.type of
          undefined -> <<"li">>;
          toggle ->  <<"a">>;
          _ -> <<"li">>
        end,
  Role = case Record#menuitem.type of
           undefined -> menuitem;
           radio -> menuitemradio;
           checkbox -> menuitemcheckbox;
           popout ->  menuitem;
           popout_clean ->  menuitem;
           toggle ->  menuitem;
           divider -> separator;
           _ -> menuitem
         end,
  PopoutClass = case Record#menuitem.type of
                  popout -> ["dropdown"];
                  popout_clean -> ["dropdown"];
                  _ -> []
                end,
  ToggleClass = case Record#menuitem.type of
                  toggle -> ["dropdown-toggle"];
                  _ -> []
                end,
  ActiveClass = case Record#menuitem.active of
                  true -> ["active"];
                  false -> []
                end,
  IconR = case Record#menuitem.iconr of
           undefined -> [];
           Ir -> #i{icon=Ir}
         end,
  IconL = case Record#menuitem.iconl of
            undefined -> [];
            Il -> #i{icon=Il}
          end,
  Body = case Record#menuitem.type of
           popout -> [Toggle|Menu] = Record#menuitem.body, %% Split the Toggle Button for Dropdowns (Should always be the Head menuitem)
             [
               Toggle,
               #menu{class=["dropdown-menu"], body=Menu}
             ];
           popout_clean -> [Toggle|Menu] = Record#menuitem.body, %% Split the Toggle Button for Dropdowns (Should always be the Head menuitem)
             [
               Toggle,
               #menu{class=["dropdown-menu", "navmenu-nav"], body=Menu}
             ];
           divider -> #hr{};
           toggle -> [IconL, Record#menuitem.body, IconR];
           _ -> #link{body=[IconL, Record#menuitem.body, IconR]}
         end,
  ToggleData = case Record#menuitem.type of
                 undefined -> undefined;
                 toggle -> <<"dropdown">>;
                 _ -> undefined
               end,
  Fields = [{<<"id">>, Record#menuitem.id},
            {<<"class">>, lists:append([ToggleClass, ActiveClass, PopoutClass], Record#menuitem.class)},
            {<<"style">>, Record#menuitem.style},
            {<<"role">>, Role},
            {<<"title">>, Record#menuitem.title},
            {<<"aria-checked">>, Record#menuitem.active},
            {<<"data-toggle">>, ToggleData}],
  Data = Record#menuitem.data_fields,
  wf_tags:emit_tag(Tag, wf:render(Body), lists:append([Fields, Data])).