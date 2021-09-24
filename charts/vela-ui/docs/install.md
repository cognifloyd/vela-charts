# Drone "Paths Changed" Conversion extension installation with Helm

This page will guide you through using the `drone-convert-pathschanged` Helm chart to install the Drone "Paths Changed" [Conversion extension](https://docs.drone.io/extensions/conversion/).

**Note: Before beginning installation, you should have functioning deploys of Drone server. Refer to the their respective charts if needed:**

* [drone](../../drone/README.md)

## Configuration (values)

**Note: This guide assumes that the Drone server and the "Paths Changed" Conversion extension are installed in the `drone` namespace. Feel free to change this as desired, but we suggest co-locating the two in the same namespace as a start.**

In order to install the chart, you'll need to pass in additional configuration. This configuration comes in the form of Helm values, which are key/value pairs. A minimal install of Drone server requires the following values:

```yaml
## The keys within the "env" map are mounted as environment variables on the convert extension pod.
##
env:
  ## REQUIRED: Shared secret value for comms between the Drone server and this conversion extension.
  ## Must match the value set in drone's env.DRONE_CONVERT_PLUGIN_SECRET.
  ## Ref: https://docs.drone.io/server/reference/drone-convert-plugin-secret/
  ##
  DRONE_SECRET: your-shared-secret-value-here

  PROVIDER: github
  TOKEN: 9e6eij3ckzvpe9mrhnqcis6zf8dhopmm46e3pi96
``` 

Copy these into a new file, which we'll call `drone-convert-pathschanged-values.yaml`. Adjust the included defaults to reflect your environment. Make note of the value that you use for `DRONE_SECRET`, as you'll need to set that in the Drone server's config.

## Run the installation

Run `helm install` with your values provided:

```console
$ helm install --namespace drone drone-convert-pathschanged drone/drone-convert-pathschanged -f drone-convert-pathschanged-values.yaml
```

To break down the above, this command means: "install the `drone/drone-convert-pathschanged` chart as a Helm release named `drone-convert-pathschanged` in the `drone` namespace. The `drone-convert-pathschanged.yaml` file will be used for configuring Drone." See `helm install --help` for a full list of parameters and flags.

Once the `install` command is ran, your Kubernetes cluster will begin creating resources. To see how your deploy is shaping up, run:

```console
$ kubectl --namespace drone get pods
NAME                                        READY   STATUS    RESTARTS   AGE
drone-76d6bb8968-2s5n9                      1/1     Running   0          1h
drone-runner-kube-696cf7b8d6-pds2h          1/1     Running   0          10m
drone-convert-pathschanged-547799b4db-c58wv 1/1     Running   0          1m
```

If the `drone-convert-pathschanged-*` pod's state is `Running`, the secret extension process successfully launched. Check the logs to make sure there are no warnings or errors:

```console
$ kubectl --namespace drone logs \
    -l 'app.kubernetes.io/name=drone-convert-pathschanged' \
    -l 'app.kubernetes.io/component=drone-convert-pathschanged'

time="2020-01-29T00:02:18Z" level=info msg="server listening on address :3000"
```

If you see the "starting the server" text above without error, the Drone "Paths Changed" Conversion extension is ready.

## Point Drone server at Drone "Paths Changed" Conversion Extension

Now that you have the "Paths Changed" Conversion extension installed alongside the Drone server, you'll need to update your Drone server configs to point at the conversion extension. Within your values for the Drone server, add the following environment variables to the existing `env` section:

```yaml
env:
  # <... your existing values here>

  ## Ref: https://docs.drone.io/server/reference/drone-convert-plugin-endpoint/
  #
  DRONE_CONVERT_PLUGIN_ENDPOINT: http://drone-convert-pathschanged:3000
  ## Ref: https://docs.drone.io/server/reference/drone-convert-plugin-secret/
  #
  DRONE_CONVERT_PLUGIN_SECRET: your-shared-secret-value-here
```

The `DRONE_CONVERT_PLUGIN_ENDPOINT` variable points to a Kubernetes Services that the chart created to front the convert extension. `DRONE_CONVERT_PLUGIN_SECRET` must be the same value that you set in the secret extension's configs as `DRONE_SECRET`.


## Next steps

Now that the convert extension and Drone server are configured, see the [Paths Changed Conversion extension docs](https://github.com/meltwater/drone-convert-pathschanged#examples) for details on how to get started using the paths changed features in your pipelines.

## Help!

If you have questions or have encountered issues, visit the [Drone community site](https://discourse.drone.io/) to share.
