component {

    this.metadata = {
        methods: {
            'retrieve': {
                path: '/stockItems/{productSku}'
            },

            'lowStock' : {
                arguments: deserializeJSON('{
                    "pageSize":"integer",
                    "currentPage":"integer",
                    "qty":"integer",
                    "scopeId":"integer"
                }'),
                path: '/stockItems/lowStock'
            }
        }
    };

}
