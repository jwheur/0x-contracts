contract MSignatureValidator is
    ISignatureValidator
{
    event SignatureValidatorApproval(
        address indexed signerAddress,     // Address that approves or disapproves a contract to verify signatures.
        address indexed validatorAddress,  // Address of signature validator contract.
        bool approved                      // Approval or disapproval of validator contract.
    );

    // Allowed signature types.
    enum SignatureType {
        Illegal,         // 0x00, default value
        Invalid,         // 0x01
        EIP712,          // 0x02
        EthSign,         // 0x03
        Wallet,          // 0x04
        Validator,       // 0x05
        PreSigned,       // 0x06
        NSignatureTypes  // 0x07, number of signature types. Always leave at end.
    }

    /// @dev Verifies signature using logic defined by Wallet contract.
    /// @param hash Any 32 byte hash.
    /// @param walletAddress Address that should have signed the given hash
    ///                      and defines its own signature verification method.
    /// @param signature Proof that the hash has been signed by signer.
    /// @return True if the address recovered from the provided signature matches the input signer address.
    function isValidWalletSignature(
        bytes32 hash,
        address walletAddress,
        bytes signature
    )
        internal
        view
        returns (bool isValid);

    /// @dev Verifies signature using logic defined by Validator contract.
    /// @param validatorAddress Address of validator contract.
    /// @param hash Any 32 byte hash.
    /// @param signerAddress Address that should have signed the given hash.
    /// @param signature Proof that the hash has been signed by signer.
    /// @return True if the address recovered from the provided signature matches the input signer address.
    function isValidValidatorSignature(
        address validatorAddress,
        bytes32 hash,
        address signerAddress,
        bytes signature
    )
        internal
        view
        returns (bool isValid);
}
