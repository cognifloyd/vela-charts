SHELL=/bin/sh

.PHONY: lint
lint:
	@ct lint

.PHONY: publish
publish:
	@mkdir -p temp docs
	@helm repo add stable https://charts.helm.sh/stable
	@helm repo add incubator https://charts.helm.sh/incubator
	@helm package -u -d temp charts/vela-server
	@helm package -u -d temp charts/vela-ui
	@helm package -u -d temp charts/vela-worker
	@helm repo index --debug --url=https://cognifloyd.github.io/drone-charts --merge docs/index.yaml temp
	@mv temp/vela*.tgz docs
	@mv temp/index.yaml docs/index.yaml
	@rm -rf temp
