# Setting up the HSM

## Overview

We will set an HSM cluster, following the AWS documentation. AWS CloudHSM supports replication between HSMs in a cluster. We will do most of the operations in using the AWS command line, but we will follow the process in the console as well. The command line tools will be run from a Cloud9 host.

We will setup one HSM with all the keys, users and sharing rules, then we will add a second HSM to the cluster.

When an additional HSM is added to a CloudHSM cluster, the system takes a backup of one HSM in the cluster and restores the new HSM from the backup, meaning that the HSMs contain the same information.

It is possible to add the second HSM first, then setup the keys, users and sharing rules. However, the users and sharing rules will not be duplicated automatically. To do this, we will setup the tools on the Cloud9 host for future operations.

## Setup the Cluster

- Create new cluster in the private VPC
- Log into the Bastion
- Install the CloudHSM client

wget
https://s3.amazonaws.com/cloudhsmv2-software/CloudHsmClient/EL6/clo udhsm-client-latest.el6.x86_64.rpm
sudo yum install ./cloudhsm-client-latest.el6.x86_64.rpm

- Setup the first HSM

aws cloudhsmv2 create-hsm --cluster-id cluster-fi24dc43kln \ --availability-zone us-west-2a

- Verify the HSM (optional)

- Create Customer CRT and so on

- Initialise the cluster

- Allow the CloudHSM cluster security group to inbound from the private subnets

- Activate the HSM cluster

## HSM user accounts

- Reset the Crypto Officer password

- Setup a key management user and a remote signer user

- Store the remote signer user password in the SSM (explain why)

## Generating the keys

- Create an ECC256Key

- Create a wrapping key

- Export the secret key

- Export the public key

- Share the key with the remote signer user

- Obtain the Tezos address from the key

- Aside: using the secret key in a hot wallet

## Add the second HSM to the cluster

- Add it

- Reconfigure the Bastion host.




