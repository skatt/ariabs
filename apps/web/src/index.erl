-module(index).
-compile(export_all).
-include_lib("wf.hrl").

log_modules() -> [index,login,chat].

main() -> [ #dtl{file = "prod", ext="dtl", bindings=[{title,title()},{body,body()}]} ].

title() -> "N2O - Bootstrap".
body() ->
[
  #panel{body="Maybe that worked...."}
].

api_event(Name,Tag,Term) -> error_logger:info_msg("Index Name ~p, Tag ~p, Term ~p",[Name,Tag,Term]), event(change_me).
event({counter,C}) -> wf:update(onlinenumber,wf:to_list(C));
event(Event) -> 
    wf:info(?MODULE,"Context: ~p",[wf_context:context()]),
    error_logger:info_msg("Event: ~p", [Event]).