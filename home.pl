:- module(home,[
	      home_page/1
	      ]).



home_page(_Request) :-
    reply_html_page(
	[title('Home')],
	[
	    div(id(content),
		[div(id(main),
		     [\content]
		    )]
	       )]
    ).

content -->
    html(
	div(
	    [p(
		 "This is a test, 3211233"
	     ),
	     audio([controls],
		   [
		       source([src('./music/Buckjump.mp3'), type('audio/mp3')],''),
	    	       'Your Browser has no audio support']
		  )]
	)
    ).
