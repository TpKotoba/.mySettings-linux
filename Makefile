# Makefile for mySettings

logFILE = .archive/.log

vimrc_linkedFILE = .vimrc
gitconfig_linkedFILE = .gitconfig

bashrc_appendFILE = .bashrc_append
bashrc_backupFILE = .archive/.bashrc.old

GITCONFIG_INSTALL=INSTALL     gitconfig
gitconfig.install: .gitconfig
	@echo "$(GITCONFIG_INSTALL)"
	@ln -sf $(gitconfig_linkedFILE) ~/.gitconfig
	@echo $(shell date) $(GITCONFIG_INSTALL) >> $(logFILE)

VIMRC_INSTALL=INSTALL     vimrc
vimrc.install: .vimrc
	@echo "$(VIMRC_INSTALL)"
	@ln -sf $(vimrc_linkedFILE) ~/.vimrc
	@mkdir -p ~/.cache/vim
	@echo $(shell date) $(VIMRC_INSTALL) >> $(logFILE)


BASHRC_ARCHIVE=ARCHIVE     bashrc
BASHRC_INSTALL=INSTALL     bashrc
bashrc.install: .bashrc_append
	@echo "$(BASHRC_ARCHIVE)"
	@cp ~/.bashrc $(bashrc_backupFILE)
	@echo $(shell date) $(BASHRC_ARCHIVE) >> $(logFILE)

	@echo "$(BASHRC_INSTALL)"
	@echo "\n# $(bashrc_appendFILE) \n\nif [ -f $(shell pwd)/$(bashrc_appendFILE) ]; then\n\t. $(shell pwd)/$(bashrc_appendFILE)\nfi" >> ~/.bashrc
	@echo $(shell date) $(BASHRC_INSTALL) >> $(logFILE)

BASHRC_UNINSTALL=RECOVER     bashrc
bashrc.uninstall:
	@echo "$(BASHRC_UNINSTALL)"
	@cp -f $(bashrc_backupFILE) ~/.bashrc
	@echo $(shell date) $(BASHRC_UNINSTALL) >> $(logFILE)

BASHRC_RESET=RESET       bashrc
bashrc.reset:
	@echo "$(BASHRC_RESET)"
	@cp -f /etc/skel/.bashrc ~/.bashrc
	@echo $(shell date) $(BASHRC_RESET) >> $(logFILE)

log.clean:
	@echo "" > $(logFILE)
