# **Istio-Configurations**

## **meshConfig**</u> 
    Config used by control plane components internally.

## **enableTracing**</u> 
    Flag to control generation of trace spans and request IDs

## **components**</u> 
    Settings for resources, enablements, and component-specific configurations in Kubernetes that are not internal to the component

## **third-party-jwt**</u>
    Comes under security best practices, Third party tokens are those who have a scoped audience and expiration 

## **Telemetry**</u> 
    It defines how the telemetry is generated for workloads within a mesh

## **priorityClassName**</u>
    It allows setting for the istio-system K8s objects

## **oneNamespace**</u> 
    whether to limit the namespace of apps that the controller controls; If unset, the controller keeps track of all namespaces

## **configValidation**</u> 
    Whether to perform server-side validation of configuration.

## **operatorManageWebhooks**</u>
     Configure whether Operator manages webhook configurations

## **multiCluster**</u> 
    When pods in each cluster cannot communicate with one another directly, set to true to link the two kubernetes clusters through their respective ingressgateway services.

## **wasm**</u>     
    WebAssembly