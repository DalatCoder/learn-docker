build:
	docker image build -t dalatcoder/gsd:first-ctr .
run:
	docker container run -d --name web -p 8000:8080 dalatcoder/gsd:first-ctr
start:
	docker container start web
stop:
	docker container stop web
remove:
	docker container rm web -f
