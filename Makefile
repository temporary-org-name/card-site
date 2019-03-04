webpack = node_modules/.bin/webpack
eslint = node_modules/.bin/eslint
stylelint = node_modules/.bin/stylelint

.PHONY: deps
deps:
	npm i --no-save

.PHONY: server.run.dev
server.run.dev:
	node ./server/app.js

.PHONY: server.run.prod
server.run.prod:
	export NODE_ENVIRONMENT=production && node ./server/app.js

.PHONY: client.build.dev
client.build.dev:
	$(webpack) --config webpack.config.js -w

.PHONY: client.build.prod
client.build.prod:
	NODE_ENVIRONMENT=production $(webpack) --config webpack.config.js

.PHONY: copy.res
copy.res:
	cp -r ./client/res build/

.PHONY: lint
lint:
	$(eslint) server/**/*.js client/**/*.jsx client/**/*.js
	$(stylelint) client/**/*.scss
