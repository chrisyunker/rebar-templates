REBAR3=./bin/rebar3

all: compile

clean:
	@echo "Rebar clean..."
	@$(REBAR3) clean -a

compile:
	@echo "Rebar compile..."
	@$(REBAR3) compile

dialyzer:
	@echo "Rebar dialyzer..."
	@$(REBAR3) dialyzer

eunit:
	@echo "Rebar eunit..."
	@$(REBAR3) do eunit -cv, cover -v

xref:
	@echo "Rebar xref..."
	@$(REBAR3) xref

test: xref eunit dialyzer

.PHONY: clean compile dialyzer eunit xref

