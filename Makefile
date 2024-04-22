RUNNER:=docker compose run shell -x -c

init: build

clean:
	rm -f .tmp.*

build:
	docker compose build

serve:
	docker compose up lab
start: serve

stop:
	docker compose stop

panic: stop

serve/bg:
	docker compose up -d lab

open: open/jupyter
open/jupyter:
	python -c 'import webbrowser; webbrowser.open("http://localhost:9999/lab")'
open/neo4j:
	python -c 'import webbrowser; webbrowser.open("http://localhost:7474/")'

shell:
	docker compose run shell

smoke-test: test

test: test/stormpy-examples test/cpmpy
	${RUNNER} 'storm --version || true'
	${RUNNER} 'python -c"import stormpy; print(stormpy.__version__)"'
	notebook=./notebooks/jani-model.ipynb make run

test/stormpy-examples:
	# docker compose run storm --version
	# docker compose run storm models/dice/dice.prism
	${RUNNER} '\
		python /stormpy/examples/01-getting-started.py \
		&& python /stormpy/examples/02-getting-started.py \
		&& python /stormpy/examples/03-getting-started.py \
		&& python /stormpy/examples/04-getting-started.py'

test/cpmpy:
	docker compose run shell -x -c "cd /cpmpy/examples \
	&& ls *.py | xargs -n1 python"

run: run/nb

run/cmd:
	docker compose run shell -x -c '$${cmd}'

run/nb:
	docker compose run shell -x -c "\
		jupyter nbconvert --execute \
			--to html --stdout $${notebook}" \
	> .tmp.html
	docker compose run w3m -dump .tmp.html
