# Tidying up for Production

What we have described in this paper is an architecture suitable for development purposes. In production, we would also consider the following:

1. Generating the keys in a fully audited Key Ceremony

We need to maintain a backup of our keys. If we lose the keys, we lose the funds. When we setup the HSM passwords, we simply used values we chose. The key management user password is able to extract the keys from the HSM.

When we generated and extracted the keys, we were able to view the files containing them.

When there are large funds at stake, it is unacceptable for one individual to be able to get at the funds. 

A Key Ceremony is a predefined procedure where the passwords and keys are created under the supervision of an auditor. The passwords are generated into files that are never seen by the operator and are pasted into the relevant fields when needed. The files containing the passwords and extracted keys are stored in vaults where only approved officers are able to obtain them.

Additionally the secrets can be "sharded" using SSSS XXX, printed off and put into secure envelopes. XXXX 4 of 7 etc

![An Apple Mac, post key-ceremony](img/Apple_Mac_Post_Key_Ceremony.jpeg)

The Key Ceremony is usually performed in a segregated environment using equipment bought specifically for the purpose. At the end of the ceremony, the equipment is destroyed in a shredder so that there is no chance the keys and passwords can be recovered from it.

2. Protect the HSM and Remote Signer further by housing it in a separate AWS Account

Without access to the Remote Signer and HSM, there is little harm that can be done to the system other than stopping the baker processes. The Remote Signer prevents any malicious operations.

The VPCE and API Gateway implementation described also works between AWS accounts, meaning that the HSM and Remote Signer can sit in its own account. This account can have a different security policy for access. For example, the operators must ask an officer of the company for a 2FA secret.

3. Protecting the baker by using "front nodes".

It is possible to run the Baker's node in private peering mode, using a dedicated front node to talk to the rest of the Tezos network. In these circumstances, the Baker sits in a private VPC with peering to a public VPC in which the public nodes reside.

4. Setup a cluster of Remote Signers and use a Network Load Balancer

The Remote Signer has a protection mechanism to prevent double-signing and this works with multiple instances of the remote signer as it is implemented in DynamoDB. Setting up a cluster ensures that there are multiple instances of the signer in multiple availability zones.

However we do not recommend running more than one baker instance. Although the Remote Signer will prevent double signing, the consequences of doing so are great in that the baker is penalised and will lose some of their stake. It is better to be down for a few minutes than to double sign.



