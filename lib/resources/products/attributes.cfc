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
                defaults.searchCriteria.pageSize = 99999
            },

            'retrieve': {
                path: '/products/attributes/{attributeCode}'
            },

            'types': {
                path: '/products/attributes/types'
            },

            'options': {
                path: '/products/attributes/{attributeCode}/options'
            },
        }
    };

}
