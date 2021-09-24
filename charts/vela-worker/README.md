# Vela worker

[Vela](http://go-vela.github.io/docs/) is a Pipeline Automation (CI/CD) framework built on Linux container technology written in Golang.

This Chart is for installing the Vela worker configured to use the kubernetes runtime.

## Installing Vela worker

See the [vela-worker chart installation guide](./docs/install.md).

## Configuring Vela worker

See [values.yaml](values.yaml) to see the Chart's default values. Refer to the [Vela worker sources](https://github.com/go-vela/worker/blob/master/cmd/vela-worker/main.go) for a more complete list of options.

To adjust an existing Vela install's configuration:

```console
# If you have a values file:
helm upgrade vela-worker vela/vela-worker --namespace vela --values vela-worker-values.yaml
# If you want to change one value and don't have a values file:
helm upgrade vela-worker vela/vela-worker --namespace vela --reuse-values --set someKey=someVal
```

## Upgrading Vela worker

Read the [release notes](https://github.com/go-vela/community/blob/master/migrations/v0.9/README.md) to make sure there are no backwards incompatible changes. Make adjustments to your values as needed, then run `helm upgrade`:

```console
# This pulls the latest version of the vela-worker chart from the repo.
helm repo update
helm upgrade vela-worker vela/vela-worker --namespace vela --values vela-worker-values.yaml
```

## Uninstalling Vela worker

To uninstall/delete the `vela-worker` deployment in the `vela` namespace:

```console
helm delete vela-worker --namespace vela
```

Substitute your values if they differ from the examples. See `helm delete --help` for a full reference on `delete` parameters and flags.
