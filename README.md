
 ## Custom Monitoring Setup

<img class=" lazyloaded" src="https://github.com/Tarikul-Islam-Anik/Microsoft-Teams-Animated-Emojis/blob/master/Emojis/Activities/Party%20Popper.png?raw=true" alt="Party Popper" title="Party Popper" width="31" height="31"> This is a Custom Monitoring Setup with additional dashboards added with the help of the kube-prometheus-stack chart from prometheus-community helm charts.


![grafana (1)](https://github.com/theArcianCoder/monitoring-setup/assets/65061393/1a8a4dae-7dfe-4742-a98f-1b1f0849fab3) ![helm](https://github.com/theArcianCoder/monitoring-setup/assets/65061393/7214fa27-8d59-47a3-acc8-4eb5d56afa08) ![kubernetes](https://github.com/theArcianCoder/monitoring-setup/assets/65061393/9cf39729-2e20-47af-8e9d-e6315fbaff24)


## <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Backhand%20Index%20Pointing%20Right%20Light%20Skin%20Tone.png" alt="Backhand Index Pointing Right Light Skin Tone" width="25" height="25" /> Requirements

<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Microsoft-Teams-Animated-Emojis/master/Emojis/Travel%20and%20places/Star.png" alt="Star" width="23" height="23" />Before installation please have a these dependencies installed:

  1. Helm
  2. Kubectl
  3. minikube(if installation on minikube)
  4. kubeadm and other tools for cloud
  5. Lens-Desktop

## <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Backhand%20Index%20Pointing%20Right%20Light%20Skin%20Tone.png" alt="Backhand Index Pointing Right Light Skin Tone" width="25" height="25" /> Installation

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

## <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Backhand%20Index%20Pointing%20Right%20Light%20Skin%20Tone.png" alt="Backhand Index Pointing Right Light Skin Tone" width="25" height="25" /> Additional Info

<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Microsoft-Teams-Animated-Emojis/master/Emojis/Travel%20and%20places/Star.png" alt="Star" width="23" height="23" />To add Prometheus configuration in kube-prometheus-stack using the `values.yml` file, you can modify the `prometheus` section. Here's an example of where you can add custom configurations:

![ezgif com-video-to-gif (1)](https://github.com/theArcianCoder/monitoring-setup/assets/65061393/15a1a98f-4995-4e16-a984-efddc006dc72)


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

After making these changes, you can deploy.<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Microsoft-Teams-Animated-Emojis/master/Emojis/Travel%20and%20places/Star.png" alt="Star" width="23" height="23" />

-----------------------------

<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Microsoft-Teams-Animated-Emojis/master/Emojis/Travel%20and%20places/Star.png" alt="Star" width="23" height="23" />To add your own image of Grafana in the Grafana Helm chart `values.yaml`, you can modify the `image` section under the `grafana` section. Here's an example of how you can specify your custom Grafana image:

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

![ezgif com-video-to-gif](https://github.com/theArcianCoder/monitoring-setup/assets/65061393/399165ba-00c7-4f8a-9347-a9b432033b5c)

<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Microsoft-Teams-Animated-Emojis/master/Emojis/Travel%20and%20places/Star.png" alt="Star" width="23" height="23" />To add data sources in the  '/templates/grafana' using the `configmaps-datasources.yaml` file for the `monitoring-stack`, you can modify the file directly or provide an updated version through a ConfigMap in your Kubernetes cluster. Here's an example of how you can define data sources in `configmaps-datasources.yaml`:

```yaml
# configmaps-datasources.yaml

apiVersion: v1
kind: ConfigMap
metadata:
  name: kube-prometheus-sta/templates/grafana/dashboards-1.14/ck-grafana-datasources
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

## <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Backhand%20Index%20Pointing%20Right%20Light%20Skin%20Tone.png" alt="Backhand Index Pointing Right Light Skin Tone" width="25" height="25" /> Add dashboard in the monitoring stack.
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Microsoft-Teams-Animated-Emojis/master/Emojis/Travel%20and%20places/Star.png" alt="Star" width="23" height="23" /> To add custom dashboards in the monitoring stack follow these step :

![ezgif com-video-to-gif (2)](https://github.com/theArcianCoder/monitoring-setup/assets/65061393/6f9077e2-f198-476a-a728-3b22c9ea89ea)


1. Go in /templates/grafana/dashboards-1.14/ folder and add a yaml file with the specific format to get the dashboard you need.
```yaml
# dashboard.yaml

{{- /*
Generated from 'scheduler' from https://raw.githubusercontent.com/prometheus-operator/kube-prometheus/main/manifests/grafana-dashboardDefinitions.yaml
Do not change in-place! In order to change this file first read following link:
https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack/hack
*/ -}}
{{- $kubeTargetVersion := default .Capabilities.KubeVersion.GitVersion .Values.kubeTargetVersionOverride }}
{{- if and (or .Values.grafana.enabled .Values.grafana.forceDeployDashboards) (semverCompare ">=1.14.0-0" $kubeTargetVersion) (semverCompare "<9.9.9-9" $kubeTargetVersion) .Values.grafana.defaultDashboardsEnabled .Values.kubeScheduler.enabled }}
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: {{ template "kube-prometheus-stack-grafana.namespace" . }}
  name: {{ printf "%s-%s" (include "kube-prometheus-stack.fullname" $) "your-custom-dashboard-name" | trunc 63 | trimSuffix "-" }}
  annotations:
{{ toYaml .Values.grafana.sidecar.dashboards.annotations | indent 4 }}
  labels:
    {{- if $.Values.grafana.sidecar.dashboards.label }}
    {{ $.Values.grafana.sidecar.dashboards.label }}: {{ ternary $.Values.grafana.sidecar.dashboards.labelValue "1" (not (empty $.Values.grafana.sidecar.dashboards.labelValue)) | quote }}
    {{- end }}
    app: {{ template "kube-prometheus-stack.name" $ }}-grafana
{{ include "kube-prometheus-stack.labels" $ | indent 4 }}
data:
  'your-custom-dashboard-name'.json: |-

    .... Your-Custom-Dashboard-Json....

{{ end }}
```
 Replace the 'your-custom-dashboard-name' with your dashboard name.
Note: Remove unnecessary dashboards.yaml if it shows an error as shown below :
![image](https://github.com/theArcianCoder/monitoring-setup/assets/65061393/11002318-a325-4f13-ac66-ee1d58afb3a4)

## <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Backhand%20Index%20Pointing%20Right%20Light%20Skin%20Tone.png" alt="Backhand Index Pointing Right Light Skin Tone" width="25" height="25" /> Run using Terraform
<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Microsoft-Teams-Animated-Emojis/master/Emojis/Travel%20and%20places/Star.png" alt="Star" width="23" height="23" />To clone a Git repository and run a Bash file within it using a provisioner in Terraform, you can follow these steps:

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

### <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Backhand%20Index%20Pointing%20Right%20Light%20Skin%20Tone.png" alt="Backhand Index Pointing Right Light Skin Tone" width="25" height="25" /> Note :

Whenever you are running the entire setup on a cloud, attach a Cloudwatch access policy in the nodes which allow cloudwatch datasource to have access for the generation of metrics. 

