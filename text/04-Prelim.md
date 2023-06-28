# Preliminaries

## Infrastructure design

![Architecture Diagram](img/ArchtectureDiagram.png)

The Baker instance will reside in a public VPC and have Internet access. No incoming connections will be allowed. 

We will deploy the HSM cluster into a private VPC along with a single EC2 instance to run the Remote Signer software. We will use a Cloud9 host to setup the HSM and log into the Remote Signer host.

The Remote Signer uses DynamoDB to record information used during the signing process. One of the pieces of information is the high-watermark (or block height), which is used to record whether the signer has signed a block or not. This is used to prevent double signing.

An API Gateway will be used to present the Remote Signer to other systems. We will use a VPC link and an VPC endpoint in the baking account to allow the Baker to call the API Gateway. The resource policy on the API Gateway will only allow connections from the single VPC endpoint [^1].

[^1]: This extends the best-practice described in the AWS CloudHSM documentation for protecting an HSM but is also a common technique in the AWS SysOps examination.

XXX We could simplify this by not using the API Gateway...


## EC2

- SSH key
-
## Infrastructure and Networks

## Outline

- VPCs
- Peering and interfaces (etc)