-module(login).
-compile(export_all).
-include_lib("avz/include/avz.hrl"). %% ?METHODS defined here.
-include_lib("n2o/include/wf.hrl").
-include_lib("kvs/include/user.hrl").

main() ->
  avz:callbacks(?METHODS),
  [ #dtl{file = "login",  ext="dtl",bindings=[{title,<<"Login">>},{sdk,avz:sdk(?METHODS)},{buttons,avz:buttons(?METHODS)}]} ].

event({counter,C}) -> wf:update(onlinenumber,wf:to_list(C));
event(X) -> 
    avz:event(X).
api_event(X,Y,Z) -> avz:api_event(X,Y,Z).
