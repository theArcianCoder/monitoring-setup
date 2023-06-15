
Custom Monitoring Setup 

This is a Custom Monitoring Setup with additional dashboards added with the help of the kube-prometheus-stack chart from prometheus-community helm charts.


## Requirements

Before installation please have a these dependencies installed:

  1. Helm
  2. Kubectl
  3. minikube(if installation on minikube)
  4. kubeadm and other tools for cloud
  5. Lens-Desktop

## Installation

Clone the repo using command :

```bash
  git clone https://github.com/theArcianCoder/monitoring-setup.git
```
Open the project using the Integrated terminal :

```bash
  sh {script_filename}
```
Enter the required information i.e; release_name, required_url etc.

Change the service type to NodePort or LoadBalancer according to the ease of access.

## Additional Info

To add Prometheus configuration in kube-prometheus-stack using the `values.yml` file, you can modify the `prometheus` section. Here's an example of where you can add custom configurations:

1. Open the `values.yml` file for kube-prometheus-stack.

2. Locate the `prometheus` section in the file. It should look similar to this:

```yaml
prometheus:
  prometheusSpec:
    ...
```

3. Add your custom configuration options under the `prometheusSpec` section. For example, to add a new scrape job for a target, you can do the following:

```yaml
prometheus:
  prometheusSpec:
    ...
    additionalScrapeConfigs:
      - job_name: my_custom_job
        static_configs:
          - targets:
              - my_custom_target:9090
```

In the above example, a new scrape job named `my_custom_job` is added with a target of `my_custom_target:9090`.

4. Save the `values.yml` file with your modifications.

After making these changes, you can deploy.

-----------------------------

To add your own image of Grafana in the Grafana Helm chart `values.yaml`, you can modify the `image` section under the `grafana` section. Here's an example of how you can specify your custom Grafana image:

1. Open the `values.yaml` file for the Grafana Helm chart.

2. Locate the `grafana` section in the file. It should look similar to this:

```yaml
grafana:
  ...
  image:
    repository: grafana/grafana
    tag: 8.1.5
    ...
```

3. Update the `repository` and `tag` fields under the `image` section to specify your custom Grafana image. For example:

```yaml
grafana:
  ...
  image:
    repository: my-registry/my-grafana-image
    tag: latest
    ...
```

In the example above, the `repository` is set to `my-registry/my-grafana-image`, which should point to the location of your custom Grafana image. The `tag` is set to `latest`, but you can use any desired tag or version for your image.

Sidecar image used in the repository :  docker.io/thearciancoder/image

Moreover you can add more custom dashboards on path: /templates/grafana/dashboards-1.14