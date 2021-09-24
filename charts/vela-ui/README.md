# Drone "Paths Changed" Conversion extension

[Drone](http://drone.io/) is a Continuous Integration platform built on container technology.

This Chart is for installing the [Paths Changed Conversion extension](https://github.com/meltwater/drone-convert-pathschanged) for Drone.

## Installing "Paths Changed" Conversion extension

See the [drone-convert-pathschanged chart installation guide](./docs/install.md).

## Configuring "Paths Changed" Conversion extension

See [values.yaml](values.yaml) to see the Chart's default values.

To adjust an existing Drone install's configuration:

```console
# If you have a values file:
helm upgrade drone-convert-pathschanged drone/drone-convert-pathschanged --namespace drone --values drone-convert-pathschanged-values.yaml
# If you want to change one value and don't have a values file:
helm upgrade drone-convert-pathschanged drone/drone-convert-pathschanged --namespace drone --reuse-values --set someKey=someVal
```

## Upgrading "Paths Changed" Conversion extension

Read the [release notes](https://discourse.drone.io/c/announcements/6) to make sure there are no backwards incompatible changes. Make adjustments to your values as needed, then run `helm upgrade`:

```console
# This pulls the latest version of the drone chart from the repo.
help repo update
helm upgrade drone-convert-pathschanged drone/drone-convert-pathschanged --namespace drone --values drone-convert-pathschanged-values.yaml
```

## Uninstalling "Paths Changed" Conversion extension

To uninstall/delete the `drone` deployment in the `drone` namespace:

```console
helm delete drone-convert-pathschanged --namespace drone
```

Substitute your values if they differ from the examples. See `helm delete --help` for a full reference on `delete` parameters and flags.

## Support

For questions, suggestions, and discussion, visit the [Drone community site](https://discourse.drone.io/).
