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
                path: '/products/attributes',
                hint: 'Retrieve all attributes for entity type',
                defaults.searchCriteria.pageSize = 99999
            },

            'retrieve': {
                path: '/products/attributes/{attributeCode}',
                hint: 'Retrieve specific attribute'
            },

            'types': {
                path: '/products/attributes/types',
                hint: 'Retrieve list of product attribute types'
            },

            'options': {
                path: '/products/attributes/{attributeCode}/options',
                hint: 'Retrieve list of attribute options'
            },
        }
    };

}
