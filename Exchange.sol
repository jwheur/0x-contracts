// solhint-disable no-empty-blocks
contract Exchange is
    MixinExchangeCore,
    MixinMatchOrders,
    MixinSignatureValidator,
    MixinTransactions,
    MixinAssetProxyDispatcher,
    MixinWrapperFunctions
{
    string constant public VERSION = "2.0.0";

    // Mixins are instantiated in the order they are inherited
    constructor ()
        public
        MixinExchangeCore()
        MixinMatchOrders()
        MixinSignatureValidator()
        MixinTransactions()
        MixinAssetProxyDispatcher()
        MixinWrapperFunctions()
    {}
}
