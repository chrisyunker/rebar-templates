.PHONY: clean

all: compile

get-deps: rebar
	./rebar get-deps

compile: get-deps
	./rebar compile

app: get-deps
	./rebar compile skip_deps=true -f

test: compile
	./rebar eunit

clean: rebar
	./rebar clean

rebar:
	wget http://cloud.github.com/downloads/basho/rebar/rebar && chmod u+x rebar

