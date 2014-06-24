-module(element_header).
-author('Scott Cowick').
-include("wf.hrl").
-compile(export_all).

reflect() -> record_info(fields, header).
render_element(Record) ->
  Tag = <<"header">>,
  Body = wf:render(Record#header.body),
  Role = case Record#header.role of
           undefined -> banner;
           R -> R
         end,
  Fields = [{<<"id">>,   Record#header.id},
            {<<"class">>, Record#header.class},
            {<<"style">>, Record#header.style},
            {<<"title">>, Record#header.title},
            {<<"role">>, Role}],
  Data = Record#header.data_fields,
  wf_tags:emit_tag(Tag, Body, lists:append([Fields, Data])).

sample(Title) ->
  #header{class=["navbar"], body=#container{body=[
    #panel{class=["navbar-header"], body=[
      #button{class=["navbar-toggle"], toggle=collapse, target="#site_nav",
        body=[#span{class=["sr-only"], body="Toggle navigation"},#i{icon="bars"}]},
      #link{class=["navbar-brand"], body=Title}
    ]},
    #nav{id=site_nav, class=["collapse", "navbar-collapse"], body=[
      #menubar{class=["nav", "navbar-nav"], body=[
        #menuitem{body="Link"},
        #menuitem{body="Link"},
        #menuitem{body="Link"},
        #menuitem{body="Link"},
        #menuitem{body="Link"}
      ]},
      #menubar{class=["nav", "navbar-nav", "navbar-right"], body=[
        #menuitem{body="Link"},
        #menuitem{type=popout, body=[
          #menuitem{type=toggle, body="Dropdown", iconr="caret-down"},
          #menuitem{body="Link"},
%% TODO: Add Multi-Level Popouts
%              #menuitem{type=popout, body=[
%                #menuitem{type=toggle, body="Dropdown", iconr="caret-down"},
%                #menuitem{body="Link"},
%                #menuitem{body="Link"},
%                #menuitem{body="Link"}
%              ]},
          #menuitem{body="Link"}
        ]},
        #menuitem{body="Link"}
      ]}
    ]}
  ]}}.