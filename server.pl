:- use_module(library(http/http_unix_daemon)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/html_head)).
:- use_module(library(http/http_path)).
:- use_module(library(settings)).

:- initialization http_daemon.


:- use_module(home).


% Resource Files
% :- html_resource(static('styles.css'), []).

%:- html_resource(swi_site,
%		 [ virtual(true)]).


  % URL handlers
:- http_handler(root(.), home_page, []).



server(Port) :-
    write('server starting'),
    http_server(http_dispatch,
		[port(Port)]).

