-ifndef(N2O_BOOTSTRAP_HRL).
-define(N2O_BOOTSTRAP_HRL, true).

-include("../../../deps/n2o/include/wf.hrl").

% emulate msg ! socket through wire
-define(WS_SEND(Id,Ev,Detail), wf:wire(wf:f("document.getElementById('~s').dispatchEvent("
  "new CustomEvent('~s', {'detail': ~s}));", [Id,wf:to_list(Ev),wf:json([Detail])]))).

% REST macros
-define(rest(), is_rest() -> true).
-define(unmap(Record), unmap(P,R) -> wf_utils:hunmap(P,R,record_info(fields, Record),size(R)-1)).
-define(map(Record), map(O) ->
    Y = [ try N=lists:nth(1,B), if is_number(N) -> wf:to_binary(B); true -> B end catch _:_ -> B end
          || B <- tl(tuple_to_list(O)) ],
    lists:zip(record_info(fields, Record), Y)).

-endif.
