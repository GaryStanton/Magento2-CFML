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
                path: '/categories/attributes',
                defaults.searchCriteria.pageSize = 99999,
                hint: 'Retrieve all attributes for entity type',
                docs: 'https://magento.redoc.ly/2.3.6-admin/##operation/catalogCategoryAttributeRepositoryV1GetListGet'
            },

            'retrieve': {
                path: '/categories/attributes/{attributeCode}',
                hint: 'Retrieve specific attribute',
                docs: 'https://magento.redoc.ly/2.3.6-admin/##operation/catalogCategoryAttributeRepositoryV1GetGet'
            },

            'options': {
                path: '/categories/attributes/{attributeCode}/options',
                hint: 'Retrieve list of attribute options',
                docs: 'https://magento.redoc.ly/2.3.6-admin/##operation/catalogCategoryAttributeOptionManagementV1GetItemsGet'
            },
        }
    };

}
