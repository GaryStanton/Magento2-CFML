component {

    this.metadata = {
        methods: {
            'index': {
                arguments: deserializeJSON('{
                    "depth":"integer",
                    "rootCategoryId":"integer"
                }'),
                path: '/categories'
            },

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
                path: '/categories/list'
            },

            'retrieve': {
                path: '/categories/{categoryId}'
            }
        }
    };


    /**
     * Recursive function to add category data as returned by the Magento API into a query object
     * @param {array}       CategoryData - The category data as returned by the Magento API call
     * @param {query}       CategoryQuery - When used recursively, this function will pass the existing query to this param
     */
    function addCategoriesToQuery(required array CategoryData, query CategoryQuery) {
        if (!structKeyExists(Arguments, 'CategoryQuery')) {
            Arguments.CategoryQuery = queryNew('id,parent_id,name,level,product_count,is_active,position');
        }

        for (Local.thisCategory in Arguments.CategoryData) {
            if (StructKeyExists(Local.thisCategory, 'children_data') && ArrayLen(Local.thisCategory.children_data)) {
                this.addCategoriesToQuery(Local.thisCategory.children_data, Arguments.CategoryQuery);
            }
            queryAddRow(Arguments.CategoryQuery, Local.thisCategory);
        }

        return Arguments.CategoryQuery;
    }

    /**
     * Recursive function to retrieve category parents. Returns an array of category names
     * @param  {numeric}    Id - The Category ID
     * @param  {query}      CategoryQuery - Pass a category query on which to work. Must contain 'name,id,parent_id,is_active'
     * @param  {array}      ReturnArray - When used recursively, this function will pass the existing array to this param
     * @return {array}      An array of category names from the given to the root
     */
    function getCategoryPathArray(required numeric Id, required query CategoryQuery, array ReturnArray) {
        if (!structKeyExists(Arguments, 'ReturnArray')) {
            Arguments.ReturnArray = []
        }

        Local.thisCat = queryExecute("
            SELECT  *
            FROM    Arguments.CategoryQuery
            
            WHERE   is_active   = true
            AND     id          = :Id
            ORDER BY level ASC
            "
        ,   {
                Id = {cfsqltype = "CF_SQL_INTEGER", value = Arguments.Id}
            }
        ,   { 
                dbtype="query" 
            } 
        );

        if (Local.thisCat.RecordCount) {
            arrayAppend(Arguments.ReturnArray, Local.thisCat.Name);
            this.getCategoryPathArray(Local.thisCat.parent_id, Arguments.CategoryQuery, Arguments.ReturnArray);
        }

        return Arguments.ReturnArray;
    }

    /**
     * Retrieve a delimited string containing the path of a given category ID
     * @param  {numeric}    Id - The Category ID
     * @param  {query}      CategoryQuery - Pass a category query on which to work. Must contain 'name,id,parent_id,is_active'
     * @param  {string}     Delimiter - The delimiter to use in the returned string
     * @return {string}     The delimted category path
     */
    function getCategoryPath(required numeric Id, required query CategoryQuery, Delimiter = ' > ', IncludeRoot = true) {
        Local.categoryPathArray = this.getCategoryPathArray(Arguments.Id, Arguments.CategoryQuery).reverse();
        if (ArrayLen(Local.categoryPathArray) && !Arguments.IncludeRoot) {
            arrayDeleteAt(Local.categoryPathArray, 1);
        }
        return ArrayToList(Local.categoryPathArray, Arguments.Delimiter);
    }



    function getCategoryPaths(CategoryData, IncludeRoot = true) {
        Local.categoryQuery = this.addCategoriesToQuery(this.index().content.children_data);
        for (Local.thisCategory in Local.categoryQuery) {
            Local.CategoryPath = this.getCategoryPath(Local.thisCategory.Id, Local.categoryQuery, ' > ', Arguments.includeRoot);
            if (Len(Local.CategoryPath)) { // Inactive cats will result in a zero length path
                Local.categoryPaths['cat_#Local.thisCategory.Id#'] = Local.CategoryPath;
            }
        }

        return Local.categoryPaths;
    }
}
