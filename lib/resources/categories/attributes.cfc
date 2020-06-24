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
                docs: 'https://devdocs.magento.com/redoc/2.3/admin-rest-api.html##operation/catalogCategoryAttributeRepositoryV1GetListGet'
            },

            'retrieve': {
                path: '/categories/attributes/{attributeCode}',
                hint: 'Retrieve specific attribute',
                docs: 'https://devdocs.magento.com/redoc/2.3/admin-rest-api.html##operation/catalogCategoryAttributeRepositoryV1GetGet'
            },

            'options': {
                path: '/categories/attributes/{attributeCode}/options',
                hint: 'Retrieve list of attribute options',
                docs: 'https://devdocs.magento.com/redoc/2.3/admin-rest-api.html##operation/catalogCategoryAttributeOptionManagementV1GetItemsGet'
            },
        }
    };

}
