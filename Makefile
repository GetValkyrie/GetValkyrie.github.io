# Makefile for GetValkyrie documentation
#

# You can set these variables from the command line.
DOCSDIR       = docs
DOCSREMOTE    = docs
DOCSSOURCE    = docs_source
COMMITMSG     = Updated docs.

.PHONY: help clean docs-init docs-clean docs-update docs-fix docs-push docs-all

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  docs-init    to set a git remote pointing to our docs repo"
	@echo "  docs-update  to update our docs"

clean:
	rm -rf $(DOCSDIR)

docs-init:
	git remote add -f $(DOCSREMOTE) https://github.com/GetValkyrie/docs.git
	@echo
	@echo "Init finished. Remote for docs subtree added as '$(DOCSREMOTE)'."

docs-clean:
	make clean
	git rm -r $(DOCSDIR)
	@echo
	@echo "Cleanup finished. Stale documentation has been removed."

docs-pull:
	git fetch $(DOCSREMOTE)
	git subtree pull --prefix $(DOCSSOURCE) $(DOCSREMOTE) master --squash
	@echo
	@echo "Update finished. The documentation sources are up-to-date."

docs-fix:
	# Github pages do not support symlinks.
	cp $(DOCSSOURCE)/_build/html $(DOCSDIR) -r
	# Github pages do not support directories beginning with underscores.
	mv $(DOCSDIR)/_sources $(DOCSDIR)/sources
	mv $(DOCSDIR)/_static $(DOCSDIR)/static
	#find $(DOCSDIR) -type f -exec sed -i 's/_sources/sources/g' {} ';'
	grep -lr "_source" docs | xargs sed -i "s/_source/source/g"
	grep -lr "_static" docs | xargs sed -i "s/_static/static/g"
	@echo
	@echo "Fixes finished. Our docs should now work on on Github pages."

docs-push:
	git add $(DOCSDIR) $(DOCSSOURCE)
	git commit -m"$(COMMITMSG)"
	git push origin master
	@echo
	@echo "Push finished. Changes have been committed and pushed to our Github pages repo"

docs-update:
	make docs-pull
	make docs-clean
	make docs-fix
	make docs-push
	@echo
	@echo "Update finished. Changes have been committed and pushed to our Github pages repo"


