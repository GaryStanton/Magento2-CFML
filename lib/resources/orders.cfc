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
                defaults.searchCriteria.pageSize = 25,
                path: '/orders',
                hint: 'Lists orders that match specified search criteria. This call returns an array of objects, but detailed information about each object’s attributes might not be included. See https://devdocs.magento.com/codelinks/attributes.html##OrderRepositoryInterface to determine which call to use to get detailed information about all attributes for an object.',
                docs: 'https://magento.redoc.ly/2.3.6-admin/##operation/salesOrderRepositoryV1GetListGet'
            },

            'retrieve': {
                path: '/orders/{id}',
                hint: 'Get info about an order by order id',
                docs: 'https://magento.redoc.ly/2.3.6-admin/##operation/salesOrderRepositoryV1GetGet'
            }
        }
    };

}
