component {

    this.metadata = {
        methods: {
            'retrieve': {
                path: '/stockItems/{productSku}',
                hint: '',
                docs: 'https://devdocs.magento.com/redoc/2.3/admin-rest-api.html##operation/catalogInventoryStockRegistryV1GetStockItemBySkuGet'
            },

            'lowStock' : {
                arguments: deserializeJSON('{
                    "pageSize":"integer",
                    "currentPage":"integer",
                    "qty":"integer",
                    "scopeId":"integer"
                }'),
                path: '/stockItems/lowStock',
                hint: 'Retrieves a list of SKU''s with low inventory qty',
                docs: 'https://devdocs.magento.com/redoc/2.3/admin-rest-api.html##operation/catalogInventoryStockRegistryV1GetLowStockItemsGet'
            }
        }
    };

}
