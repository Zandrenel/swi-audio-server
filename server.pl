:- use_module(library(http/http_unix_daemon)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/html_head)).
:- use_module(library(http/http_path)).
% Allows files to be served
:- use_module(library(http/http_files)).
% For adding extra settings
:- use_module(library(settings)).

:- initialization http_daemon.


:- use_module(home).


% Resource Files

% Sets these
:- multifile http:location/3.
:- dynamic   http:location/3.

% Gathers files for the route
get_music(Request) :-
    http_reply_from_files('music', [], Request).
get_music(Request) :-
	  http_404([], Request).


% Alias for music file paths
http:location(music, '/music', []).


  % URL handlers
:- http_handler(root(.), home_page, []).
% Handler that serves all the music assets
:- http_handler(music(.), get_music, [prefix]).



server(Port) :-
    write('server starting'),
    http_server(http_dispatch,
		[port(Port)]).

