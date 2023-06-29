
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

## Add datasources in the monitoring stack.
To add data sources in the  '/templates/grafana' using the `configmaps-datasources.yaml` file for the `monitoring-stack`, you can modify the file directly or provide an updated version through a ConfigMap in your Kubernetes cluster. Here's an example of how you can define data sources in `configmaps-datasources.yaml`:

```yaml
# configmaps-datasources.yaml

apiVersion: v1
kind: ConfigMap
metadata:
  name: kube-prometheus-stack-grafana-datasources
  namespace: your-namespace
data:
  datasource.yaml: |-
    apiVersion: 1
    datasources:
      - name: Prometheus
        type: prometheus
        url: http://prometheus:9090
        access: proxy
        isDefault: true

      - name: CustomDataSource
        type: prometheus
        url: http://custom-prometheus:9090
        access: proxy
        isDefault: false
```


Inside `configmaps-datasource.yaml`, you can define the data sources using the YAML syntax. In this example, we have defined two data sources: `Prometheus` and `CustomDataSource`. You can add more data sources as needed, specifying the `name`, `type`, `url`, `access`, and `isDefault` properties.

## Run using Terraform
Clone a Git repository and run a Bash file within it using a provisioner in Terraform, you can follow these steps:

1. Create a new Terraform configuration file (e.g., `main.tf`) and initialize it with the necessary provider and resource blocks.

2. Define the provisioner block within the resource block where you want to perform the Git clone and run the Bash file. For example, if you want to run the provisioner after creating an EC2 instance, your code may look like this:

```hcl
resource "aws_instance" "example" {
  # Resource configuration for the EC2 instance

  provisioner "local-exec" {
    command = "git clone <repository_url> && cd <repository_directory> && chmod +x <bash_file> && ./<bash_file>"
  }
}
```

Replace `<repository_url>` with the URL of the Git repository you want to clone, `<repository_directory>` with the directory where you want to clone the repository, and `<bash_file>` with the name of the Bash file you want to execute.

3. Initialize the Terraform configuration and apply the changes:

```shell
terraform init
terraform apply
```

Terraform will execute the provisioner after creating the specified resource. It will clone the Git repository, navigate to the repository directory, make the Bash file executable, and run it.

Note: The `local-exec` provisioner runs the command on the machine running Terraform, not on the resource being provisioned. Make sure that the machine running Terraform has the necessary prerequisites (e.g., Git, Bash) installed and configured correctly.

Remember to adjust the configuration according to your specific repository, directory, and file names.
