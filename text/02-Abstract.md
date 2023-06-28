# Abstract

Tezos is a proof-of-stake blockchain [TEZOS] in which the participants, called Bakers, must stake part of their funds as a security bond against bad behaviour. The Baker must be able to sign transactions when new blocks are produced or when other blocks are verified. Consequently the Baker's secret cryptographic key must be available at all times to the Baking system. This key needs to be protected from unwanted access to avoid loss of funds. Small bakers can protect their key with a USB HSM such as Ledger, but where there is a high value of funds at risk, an enterprise-grade Hardware Security Module (HSM) is recommended. Amazon Web Services offer a single-tenant HSM product called CloudHSM [PRODUCT]. 

In this paper we will describe how to set up a test Tezos node and baker with the key protected by CloudHSM. The architecture is very similar to the recommended CloudHSM architecture [AWSHSM] where an API Gateway and VPC Endpoint governs access to the HSM. In our use case, we will incorporate a Remote Signer system that can interpret the Tezos signing requests and send them to the HSM. The Signer also protects against "Double-Signing" and other unwanted operations.

