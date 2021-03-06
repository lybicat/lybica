.PHONY: all clean atest ptest deploy
all: clean atest ptest

atest:
	@echo building acceptance test...
	pybot atest/lybica

ptest:
	@echo building performance test...
	python ptest/main.py

clean:
	@echo cleaning...

deploy:
	@echo deploy lybica-platform
	cd lybica-platform; npm install; pm2 reload api
	@echo deploy lybica-web
	cd lybica-web; npm install: npm run build

