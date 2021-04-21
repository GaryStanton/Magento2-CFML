component {

    this.metadata = {
        methods: {
            'retrieve': {
                path: '/taxRates/{rateId}',
                hint: 'Get tax rate',
                docs: 'https://magento.redoc.ly/2.3.6-admin/##operation/taxTaxRateRepositoryV1GetGet'
            },

            'search': {
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
                defaults.searchCriteria.pageSize = 99999,
                path: '/taxRates/search',
                hint: 'Search TaxRates This call returns an array of objects, but detailed information about each object’s attributes might not be included. See https://devdocs.magento.com/codelinks/attributes.html##TaxRateRepositoryInterface to determine which call to use to get detailed information about all attributes for an object.',
                docs: 'https://magento.redoc.ly/2.3.6-admin/##operation/taxTaxRateRepositoryV1GetListGet'
            }
        }
    };

}
