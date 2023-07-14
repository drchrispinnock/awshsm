# Introduction

## Outline (remove)

- Tezos & Octez - Fabrice


- AWS CloudHSM
- Single-tenant product
- Remote Signer - Fabrice
- Costs
- Double Signing. Baking

From previous abstract
- Amazon Web Services offers a single-tenant HSM product 
- The single-tenancy is important because it guarantees that only the intended customer will be able to access the key
- It is possible to use cheaper Key Management Systems (KMS) but the single-tenancy is not guaranteed. 
- Where an organisation needs to be audited, there has to be certainty over access and thus a single-tenant service provides enough confidence.

## 
Tezos uses Liquid Proof of Stake to achieve consensus. The creators of the next block are called bakers. One of them is chosen at random by all bakers, based on the number of Tez (XTZ) locked. In this process, the baker server must have access to the wallet private key in order to sign transactions. 

In order to discourage dishonest actions like double baking or double endorsement, every baker is required to deposit a set amount of Tez as a security deposit for a specific period (five cycles). If a baker tries to undermine the integrity of the chain, their deposit will be confiscated as a penalty. This measure acts as a deterrent against malicious behavior within the Tezos network.

To ensure secure signing of transactions and secure the tokens of the baker, a Hardware Security Module (HSM) is employed, which holds cryptographic keys and performs signing operations.

For smaller bakers looking to safeguard their keys, using a USB HSM like Ledger can be an effective solution. This provides an additional layer of protection. Some bakers choose to host their key on a separate system with a remote signer.

However, for accounts with significant value, it is recommended to employ an enterprise-grade HSM. These high-security modules offer enhanced protection and are well-suited for handling substantial assets. Amazon Web Services (AWS) offers a dedicated HSM product for such requirements.

The dedicated nature of the HSM is of utmost importance, as it guarantees that only the intended customer will have access to the key. This ensures the confidentiality and integrity of the transactions. In contrast, using cheaper Key Management Systems (KMS) may not provide the same level of dedicated access and security.

When an organization requires auditing, it becomes crucial to have certainty over access controls. In such cases, opting for a single-tenant service, such as a dedicated HSM, provides the necessary confidence. This way, the organization can ensure that its transactions are secure and meet the required compliance standards.


(delete if not needed) Tezos holders who don't meet the minimum requirement of 6,000 tez or prefer not to set up their own infrastructure can delegate their coins to a baker. Delegating allows coin holders to lend their coins to a baker, increasing the chances of the baker being selected to create and endorse blocks. Bakers share the additional revenue generated from the delegated tokens with the delegators, without gaining control or ownership of the coins, ensuring the safety of the delegators' funds.

Octez

Octez is the official client to interact with a Tezos node via RPC (remote procedural calls). Octez consists of several binaries (i.e., executable files), including a client, a node, and a baker. The command-line wallet tool is called “octez-client” (for Linux and macOS). No matter how you decide to run Octez, your node must have an accurate time source and be properly synchronized to it, e.g. by configuring an NTP daemon.


# Tezos Remote Signer

The Tezos remote signer is a Python Flask app that receives Tezos baking and endorsement payloads from the Tezos baking client and passes them on to a remote HSM to be signed. 

This python flask can be installed on a Amazon Elastic Compute Cloud (Amazon EC2) that is hosted in the same Amazon Virtual Private Cloud (Amazon VPC) as the CloudHSM that signs the payloads. This virtual network closely resembles a traditional network that you'd operate in your own data center, with the benefits of using the scalable infrastructure of AWS.

Note that we have only tested it on AWS CloudHSM, which is based on the Cavium LiquidSecurity FIPS PCIe Card.


