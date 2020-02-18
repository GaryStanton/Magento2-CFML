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
                path: '/products'
            },

            'retrieve': {
                path: '/products/{sku}'
            }
        }
    };




    /* List products
    this.metadata.methods.list.arguments['searchCriteria'] = {};
    this.metadata.methods.list.arguments['searchCriteria']['pageSize'] = 'integer';
    this.metadata.methods.list.arguments['searchCriteria']['currentPage'] = 'integer';
    this.metadata.methods.list.arguments['searchCriteria']['sortOrders'] = [];
    this.metadata.methods.list.arguments['searchCriteria']['sortOrders'][1]['field'] = 'string';
    this.metadata.methods.list.arguments['searchCriteria']['sortOrders'][1]['direction'] = 'string';

    this.metadata.methods.list.arguments['searchCriteria']['filter_groups'] = [];
    this.metadata.methods.list.arguments['searchCriteria']['filter_groups'][1]['filters'] = [];
    this.metadata.methods.list.arguments['searchCriteria']['filter_groups'][1]['filters'][1]['field'] = 'string';
    this.metadata.methods.list.arguments['searchCriteria']['filter_groups'][1]['filters'][1]['value'] = 'string';
    this.metadata.methods.list.arguments['searchCriteria']['filter_groups'][1]['filters'][1]['condition_type'] = 'string';
    */
}
