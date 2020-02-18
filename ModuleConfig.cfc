component {

    this.title = 'CF Magento 2';
    this.author = 'Gary Stanton';
    this.webURL = '';
    this.description = 'Magento2 CFML is a CFML (Lucee and ColdFusion) library for interacting with the Magento2 API. Borrows heavily from John Berquist''s Stripe CFML project.';

    /**
     * apiKey is required, but note that it can be set via a Java system property
     * or environment variables instead of being passed in at init.
     * See README.md for the config struct options - these can also be set via
     * system properties or environment variables if desired.
     */
    function configure() {
        settings = {
            apiKey = '',
            config = { }
        };
    }

    function onLoad() {
        binder.map( 'magento@magento2cfml' )
            .to( '#moduleMapping#.magento' )
            .asSingleton()
            .initWith( apiKey = settings.apiKey, config = settings.config );
    }

}
