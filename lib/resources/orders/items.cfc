component {

    this.metadata = {
        methods: {
            'list': {
                arguments: deserializeJSON('{
                    "searchCriteria": {
                        "pageSize":"integer",
                        "currentPage":"integer",
                        "sortOrders":[
                            {
                                "direction":"string",
                                "field":"string"
                            }
                        ],
                        "filter_groups":[
                            {
                                "filters":[
                                    {
                                        "field":"string",
                                        "condition_type":"string",
                                        "value":"string"
                                    }
                                ]
                            }
                        ]
                    }
                }'),
                path: '/orders/items',
                defaults.searchCriteria.pageSize = 99999,
                hint: 'Lists order items that match specified search criteria. This call returns an array of objects, but detailed information about each object’s attributes might not be included. See https://devdocs.magento.com/codelinks/attributes.html##OrderItemRepositoryInterface to determine which call to use to get detailed information about all attributes for an object.',
                docs: 'https://magento.redoc.ly/2.3.6-admin/##operation/salesOrderItemRepositoryV1GetListGet'
            },

            'retrieve': {
                path: '/orders/items/{id}',
                hint: 'Loads a specified order item.',
                docs: 'https://magento.redoc.ly/2.3.6-admin/##operation/salesOrderItemRepositoryV1GetGet'
            }
        }
    };

}
