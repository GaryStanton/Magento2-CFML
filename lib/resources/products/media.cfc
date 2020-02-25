component {

    this.metadata = {
        methods: {
            'list': {
                path: '/products/{sku}/media',
                hint: 'Retrieve the list of gallery entries associated with given product',
                docs: 'https://devdocs.magento.com/redoc/2.3/admin-rest-api.html##operation/catalogProductAttributeMediaGalleryManagementV1GetListGet'
            },

            'retrieve': {
                path: '/products/{sku}/media/{entryId}',
                hint: 'Return information about gallery entry',
                docs: 'https://devdocs.magento.com/redoc/2.3/admin-rest-api.html##operation/catalogProductAttributeMediaGalleryManagementV1GetGet'
            },

            'getType': {
                path: '/products/media/types/{attributeSetName}',
                hint: 'Retrieve the list of media attributes (fronted input type is media_image) assigned to the given attribute set.',
                docs: 'https://devdocs.magento.com/redoc/2.3/admin-rest-api.html##operation/catalogProductMediaAttributeManagementV1GetListGet'
            }
        }
    };
}
