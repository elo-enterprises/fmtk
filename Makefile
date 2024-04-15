init: build

clean:
	true

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

open:
	python -c 'import webbrowser; webbrowser.open("http://localhost:9999/lab")'
shell:
	docker compose run shell

smoke-test: test
test:
	# docker compose run storm --version
	# docker compose run storm models/dice/dice.prism
	docker compose run shell -x -c '\
		python /stormpy/examples/01-getting-started.py \
		&& python /stormpy/examples/02-getting-started.py \
		&& python /stormpy/examples/03-getting-started.py \
		&& python /stormpy/examples/04-getting-started.py'
	docker compose run shell -x -c 'storm --version || true'
	docker compose run shell -x -c 'python -c"import stormpy; print(stormpy.__version__)"'
