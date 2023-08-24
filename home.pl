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
	    p(
		"This is a test, 321"
	    )
	)
    ).
