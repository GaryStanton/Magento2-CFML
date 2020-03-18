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
            },

            'create': {
                arguments: deserializeJSON('
                    {
                        "entry": {
                            "id": "integer",
                            "media_type": "string",
                            "label": "string",
                            "position": "integer",
                            "disabled": "string",
                            "types": "array",
                            "file": "string",
                            "content": {
                                "base64_encoded_data": "string",
                                "type": "string",
                                "name": "string"
                            },
                            "extension_attributes": {
                                "video_content": {
                                    "media_type": "string",
                                    "video_provider": "string",
                                    "video_url": "string",
                                    "video_title": "string",
                                    "video_description": "string",
                                    "video_metadata": "string"
                                }
                            }
                        }
                    }
                '),
                httpMethod: 'post',
                multipart: true,
                path: '/products/{sku}/media/',
                hint: 'Create new gallery entry.',
                docs: 'https://devdocs.magento.com/redoc/2.3/admin-rest-api.html##operation/catalogProductAttributeMediaGalleryManagementV1CreatePost'
            }
        }
    };
}
