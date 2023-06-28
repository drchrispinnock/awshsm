# Setting up the HSM

## Overview

We will set an HSM cluster, following the AWS documentation. AWS CloudHSM supports replication between HSMs in a cluster. We will do most of the operations in using the AWS command line, but we will follow the process in the console as well. The command line tools will be run from a Cloud9 host.

We will setup one HSM with all the keys, users and sharing rules, then we will add a second HSM to the cluster.

When an additional HSM is added to a CloudHSM cluster, the system takes a backup of one HSM in the cluster and restores the new HSM from the backup, meaning that the HSMs contain the same information.

It is possible to add the second HSM first, then setup the keys, users and sharing rules. However, the users and sharing rules will not be duplicated automatically. To do this, we will setup the tools on the Cloud9 host for future operations.

## 


