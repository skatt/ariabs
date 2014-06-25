-module(account).
-compile(export_all).
-include_lib("n2o/include/wf.hrl").
-include_lib("kvs/include/user.hrl").

main() -> case wf:user() of
            undefined -> wf:redirect("/login"),[#dtl{file = "redirect",  ext="dtl",bindings=[]}];
            _ -> wf:redirect("/"),[#dtl{file = "redirect",  ext="dtl",bindings=[]}]
          end.

api_event(Name,Tag,Term) -> error_logger:info_msg("dashboard Name ~p, Tag ~p, Term ~p",[Name,Tag,Term]).
event(init) -> [];
event({counter,C}) -> wf:update(onlinenumber,wf:to_list(C));
event(U) -> wf:info("Unknown Event: ~p",[U]).
