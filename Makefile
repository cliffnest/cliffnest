.PHONY: deploy
deploy: book
	@echo "====> deploying"
	rm -rf /tmp/book/
	git worktree add -f /tmp/book gh-pages
	mdbook build
	rm -rf /tmp/book/*
	cp -rp book/* /tmp/book/
	cd /tmp/book && \
		git add -A && \
		git commit && \
		git push origin gh-pages
