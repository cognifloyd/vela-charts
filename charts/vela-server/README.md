# Vela server

[Vela](http://go-vela.github.io/docs/) is a Pipeline Automation (CI/CD) framework built on Linux container technology written in Golang.


This Chart is for installing Vela server.

## Installing Vela server

See the [vela-server chart installation guide](./docs/install.md).

## Configuring Vela server

See [values.yaml](values.yaml) to see the Chart's default values. Refer to the [Vela server sources](https://github.com/go-vela/server/blob/master/cmd/vela-server/main.go) for a more complete list of options.

To adjust an existing Vela install's configuration:

```console
# If you have a values file:
helm upgrade vela-server vela/vela-server --namespace vela --values vela-server-values.yaml
# If you want to change one value and don't have a values file:
helm upgrade vela-server vela/vela-server --namespace vela --reuse-values --set someKey=someVal
```

## Upgrading Vela server

Read the [release notes](https://github.com/go-vela/community/blob/master/migrations/v0.9/README.md) to make sure there are no backwards incompatible changes. Make adjustments to your values as needed, then run `helm upgrade`:

```console
# This pulls the latest version of the vela-server chart from the repo.
helm repo update
helm upgrade vela-server vela/vela-server --namespace vela --values vela-server-values.yaml
```

## Uninstalling Vela server

To uninstall/delete the `vela-server` deployment in the `vela` namespace:

```console
helm delete vela-server --namespace vela
```

Substitute your values if they differ from the examples. See `helm delete --help` for a full reference on `delete` parameters and flags.
