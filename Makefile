.PHONY: all clean atest ptest
all: clean atest ptest

atest:
	@echo building acceptance test...
	pybot atest/lybica

ptest:
	@echo building performance test...
	python ptest/main.py

clean:
	@echo cleaning...
