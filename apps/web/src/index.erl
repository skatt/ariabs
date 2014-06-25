-module(index).
-compile(export_all).
-include_lib("wf.hrl").

log_modules() -> [index,login,chat].

main() ->  [ #dtl{file = wf:cache(mode), ext="dtl", bindings=[{title,<<"Index">>},{body,body()}]} ].

body() -> #panel{style="font-size:38pt;height:200px;text-align: center;margin-top:200px;",
                body="Hello, N2O!"}.

api_event(Name,Tag,Term) -> error_logger:info_msg("Index Name ~p, Tag ~p, Term ~p",[Name,Tag,Term]), event(change_me).
event({counter,C}) -> wf:update(onlinenumber,wf:to_list(C));
event(Event) -> 
    wf:info(?MODULE,"Context: ~p",[wf_context:context()]),
    error_logger:info_msg("Event: ~p", [Event]).
