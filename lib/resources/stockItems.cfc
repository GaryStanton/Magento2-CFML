component {

    this.metadata = {
        methods: {
            'retrieve': {
                path: '/stockItems/{productSku}',
                hint: '',
                docs: 'https://magento.redoc.ly/2.3.6-admin/##operation/catalogInventoryStockRegistryV1GetStockItemBySkuGet'
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
                docs: 'https://magento.redoc.ly/2.3.6-admin/##operation/catalogInventoryStockRegistryV1GetLowStockItemsGet'
            }
        }
    };

}
