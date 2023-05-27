# Abstract

## Outline (remove)

XXX This needs to be refactored into a synopsis and material in the Introduction too.

- Tezos is a proof-of-stake blockchain whereby a baker must stake their funds to provide a bond
- XXX
- The baker server must have access to the wallet key to sign transactions
- A Hardware Security Module holds cryptographic keys and is able to perform signing operations.
- Small bakers are able to protect their key with a USB HSM such as the Ledger
- Some bakers choose to host their key on a separate system with a remote signer
- For high value accounts, an enterprise grade HSM is recommended.
- Amazon Web Services offers a single-tenant HSM product 
- The single-tenancy is important because it guarantees that only the intended customer will be able to access the key
- It is possible to use cheaper Key Management Systems (KMS) but the single-tenancy is not guaranteed. 
- Where an organisation needs to be audited, there has to be certainty over access and thus a single-tenant service provides enough confidence.

