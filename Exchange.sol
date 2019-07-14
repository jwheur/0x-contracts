// solhint-disable no-empty-blocks
contract Exchange is
    MixinExchangeCore,
    MixinMatchOrders,
    MixinSignatureValidator,
    MixinTransactions,
    MixinAssetProxyDispatcher,
    MixinWrapperFunctions
{
    string constant public VERSION = "2.0.1-alpha";

    // Mixins are instantiated in the order they are inherited
    constructor (bytes memory _zrxAssetData)
        public
        LibConstants(_zrxAssetData) // @TODO: Remove when we deploy.
        MixinExchangeCore()
        MixinMatchOrders()
        MixinSignatureValidator()
        MixinTransactions()
        MixinAssetProxyDispatcher()
        MixinWrapperFunctions()
    {}
}
// compared
