component {

    this.metadata = {
        methods: {
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
                path: '/taxRules/search',
                hint: 'Search TaxRules - This call returns an array of objects, but detailed information about each object’s attributes might not be included. See https://devdocs.magento.com/codelinks/attributes.html##TaxRuleRepositoryInterface to determine which call to use to get detailed information about all attributes for an object.',
                docs: 'https://magento.redoc.ly/2.3.6-admin/##operation/taxTaxRuleRepositoryV1GetListGet'
            },

            'retrieve': {
                path: '/taxRules/{ruleId}',
                hint: 'Get tax rule',
                docs: 'https://magento.redoc.ly/2.3.6-admin/##operation/taxTaxRuleRepositoryV1GetGet'
            }
        }
    };

}
