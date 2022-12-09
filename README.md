# Ant Media Server 

Ant Media Server Helm chart for Kubernetes

## Introduction
Ant Media Server installs the following
- Edge/Origin pods
- MongoDB 
- Ingress

## Prerequisites
- Kubernetes >= 1.23
- Helm v3
- cert-manager

## Installing the Chart
Add the AMS repository to Helm:
```shell script
helm repo add eks https://ant-media.github.io/Scripts/helm
helm update
helm install antmedia --set origin={origin}.{example.com} --set edge={edge}.{example.com}
```

## Installing SSL 
If you are going to use Let's Encrypt, you should create your DNS records according to the ingress IP addresses in the `kubectl get ingress` output after installation and follow the document below.

https://resources.antmedia.io/docs/ams-kubernetes-deployment#-to-install-an-ssl-certificate

## Upgrade
The old installation must be uninstalled completely before installing the new version.

## Uninstalling the Chart
```sh
helm delete antmedia 
```

## Parameters

* **origin** = Domain name of Origin server
* **edge** = Domain name of Edge Server
* **autoscalingEdge.targetCPUUtilizationPercentage** = default 60
* **autoscalingOrigin.targetCPUUtilizationPercentage** = default 60
* **autoscalingEdge.minReplicas** = default 1 
* **autoscalingOrigin.minReplicas** = default 1
* **autoscalingEdge.maxReplicas** = default 10
* **autoscalingOrigin.maxReplicas** = default 10
* **hostNetwork** = default true
* **mongodb** = MongoDB host (default internal MongoDB)
* **image** = A container image (default Ant Media Officially repo)

## Example Usage
```
helm install antmedia --set origin=origin.antmedia.io --set edge=edge.antmedia.io --set autoscalingEdge.targetCPUUtilizationPercentage=20 --set autoscalingEdge.minReplicas=2

```


| Parameter                                      | Description                                                                                              | Default                                                                            |
|------------------------------------------------| -------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| `image`                                        | image repository                                                                                         | `antmedia/enterprise:latest` |
| `origin`                                       | Domain name of Origin server                                                                             | `{}`                                                                        |
| `edge`                                         | Domain name of Edge server                                                                               | `{}`                                                                     |
| `hostNetwork`                                  | If `false`, use turn server                                                                              | `true`                                                                            |
| `mongodb`                                      | MongoDB host                                                                                             | `mongo`                                                                     |
| `autoscalingOrigin.targetCPUUtilizationPercentage`                            | Extra volume mounts for the pod                                                                          | `[]`                                                                               |
| `autoscalingOrigin.minReplicas`                                 | Extra volumes for the pod                                                                                | `[]`                                                                               |
| `autoscalingOrigin.maxReplicas`                                  | Default tags to apply to all AWS resources managed by this controller                                    | `{}`                                                                               |
| `autoscalingEdge.targetCPUUtilizationPercentage`                                 | Number of controller pods to run, only one will be active due to leader election                         | `2`                                                                                |
| `autoscalingEdge.minReplicas`                          | Limit the disruption for controller pods. Require at least 2 controller replicas and 3 worker nodes      | `{}`                                                                               |
| `autoscalingEdge.maxReplicas`                               | Defines the update strategy for the deployment                                                           | `{}`                                                                               |
