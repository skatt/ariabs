%-record(header, {?ELEMENT_BASE(element_header)}).
%-record(nav, {?ELEMENT_BASE(element_nav)}).
%-record(footer, {?ELEMENT_BASE(element_footer)}).


-record(page, {?ELEMENT_BASE(element_page), mode, scroll=true}).

-record(container, {?ELEMENT_BASE(element_container), fluid=false}).
-record(row, {?ELEMENT_BASE(element_row)}).
-record(col, {?ELEMENT_BASE(element_col), xs=12, sm=undefined, md=undefined, lg=undefined}).

%-record(button, {?ELEMENT_BASE(element_button), type= <<"button">>, target, canvas, toggle, name, value, postback, disabled}).
%-record(i, {?ELEMENT_BASE(element_i), icon}).

-record(menu, {?ELEMENT_BASE(element_menu)}).
-record(menubar, {?ELEMENT_BASE(element_menubar), control_id}).
-record(menuitem, {?ELEMENT_BASE(element_menuitem), type, active=false, iconl, iconr}).

-record(media, {
        id,
        title :: iolist(),
        width,
        height,
        html :: iolist(),
        url :: iolist(),
        version,
        thumbnail_url :: iolist(),
        type :: {atom(), atom() | string()},
        thumbnail_height}).
