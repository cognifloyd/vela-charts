# Vela UI

[Vela](http://go-vela.github.io/docs/) is a Pipeline Automation (CI/CD) framework built on Linux container technology written in Golang.

This Chart is for installing the Vela UI.

## Installing Vela UI

See the [vela-ui chart installation guide](./docs/install.md).

## Configuring Vela UI

See [values.yaml](values.yaml) to see the Chart's default values.

To adjust an existing Vela install's configuration:

```console
# If you have a values file:
helm upgrade vela-ui vela/vela-ui --namespace vela --values vela-ui-values.yaml
# If you want to change one value and don't have a values file:
helm upgrade vela-ui vela/vela-ui --namespace vela --reuse-values --set someKey=someVal
```

## Upgrading Vela UI

Read the [release notes](https://github.com/go-vela/community/blob/master/migrations/v0.9/README.md) to make sure there are no backwards incompatible changes. Make adjustments to your values as needed, then run `helm upgrade`:

```console
# This pulls the latest version of the vela chart from the repo.
help repo update
helm upgrade vela-ui vela/vela-ui --namespace vela --values vela-ui-values.yaml
```

## Uninstalling Vela UI

To uninstall/delete the `vela-ui` deployment in the `vela` namespace:

```console
helm delete vela-ui --namespace vela
```

Substitute your values if they differ from the examples. See `helm delete --help` for a full reference on `delete` parameters and flags.
