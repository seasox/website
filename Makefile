include Makefile.in

.PHONY: hugo-install
hugo-install:
	$(HUGO) $(HFLAGS_INSTALL)

.PHONY: hugo-server
hugo-server:
	$(HUGO) $(HFLAGS_SERVER)

.PHONY: install
install: hugo-install

.PHONY: server
server: hugo-server

.PHONY: deinstall
deinstall:
	rm -rf $(INSTALLPATH)/*
