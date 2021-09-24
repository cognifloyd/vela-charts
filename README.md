# Vela Helm Charts

This repository hosts helm charts for [Vela](https://go-vela.githubio/docs/). These charts are used to deploy Vela to Kubernetes.
They are based on cognifloyd's fork of the Official [Helm](https://helm.sh/) charts for [Drone](https://drone.io/).

## Install Helm

Read and follow the [Helm installation guide](https://helm.sh/docs/intro/install/).

**Note: The charts in this repository require Helm version 3.x or later.** 

## Add the Vela Helm Chart repo

In order to be able to use the charts in this repository, add the name and URL to your Helm client:

```console
# TODO: move this from drone-charts to vela-charts
helm repo add vela https://cognifloyd.github.io/vela-charts/
helm repo update
```

## Install charts

See the the READMEs for the various charts in the [charts](charts) directory. 

* If you have not yet installed Vela server, start with the [vela](charts/vela-server) chart.
* After installing `vela-server`, install [vela-worker](charts/vela-worker) to begin executing builds.

## Documentation

See the [Vela documentation](https://go-vela.github.io/docs/) site for more information.

## Kubernetes version support

Due to rapid churn in the Kubernetes ecosystem, charts in this repository assume a version of Kubernetes released in the last 12 months. This typically means one of the last four releases.

**Note: While these charts may work with versions of older versions of Kubernetes, only releases made in the last year are eligible for support.**

## Contributing

For details on how to contribute changes or additions to this repository, see the [Contributor's guide](CONTRIBUTING.md).

## License

This repository's contents are licensed under the 2-clause BSD license. See the included [LICENSE](LICENSE) file for a copy.
