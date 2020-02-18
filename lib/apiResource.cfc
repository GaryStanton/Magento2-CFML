component {

    variables.metadata = { };

    function init( required any magento2, required any config, required string resourceName ) {
        variables.magento2 = arguments.magento2;
        variables.config = arguments.config;
        variables.resourceName = resourceName;
        var resource = new 'resources.#resourceName#'();
        variables.metadata = loadMetadata( resource.metadata );
        var resourceMetadata = getMetadata( resource );
        if ( resourceMetadata.keyExists( 'functions' ) ) {
            for ( var func in getMetadata( resource ).functions ) {
                if ( func.access == 'public' ) {
                    this[ func.name ] = resource[ func.name ];
                }
            }
        }
        return this;
    }

    public struct function onMissingMethod( missingMethodName, missingMethodArguments ) {
        if ( !metadata.methods.keyExists( missingMethodName ) ) {
            var message = '`magento2.#resourceName#.#missingMethodName#()` is not a valid method for `magento2.#resourceName#`. Available methods are #metadata.methodNameList#.';
            throw( message );
        }

        // Merge in defaults
        if (metadata.methods[ missingMethodName ].keyExists('defaults')) {
            structAppend(missingMethodArguments, metadata.methods[ missingMethodName ].defaults, false);
        }

        return magento2.call(
            resourceName,
            missingMethodName,
            missingMethodArguments,
            metadata.methods[ missingMethodName ]
        );
    }

    private struct function loadMetadata( metadata ) {
        var loaded = duplicate( metadata );
        var baseMethodMeta = getBaseMethodMetadata();
       
        for ( var methodName in loaded.methods ) {
            loaded.methods[ methodName ].append( baseMethodMeta, false );
            loaded.methods[ methodName ][ 'pathArgs' ] = parsePath( loaded.methods[ methodName ].path );
            if ( !loaded.methods[ methodName ].keyExists( 'positionalArgs' ) ) {
                loaded.methods[ methodName ][ 'positionalArgs' ] = loaded.methods[ methodName ].pathArgs;
            }
        }

        var methodNameArray = loaded.methods.keyArray();
        arraySort( methodNameArray, 'text' );
        loaded.methodNameList = arrayMap( methodNameArray, function( mn ) {
            return 'magento2.#resourceName#.#mn#()';
        } );
        var length = arrayLen( loaded.methodNameList );
        loaded.methodNameList[ length ] = 'and ' & loaded.methodNameList[ length ];
        loaded.methodNameList = loaded.methodNameList.toList( ', ' );

        return loaded;
    }

    private struct function getBaseMethodMetadata() {
        return {
            endpoint: config.get( 'endpoint' ),
            httpMethod: 'get',
            multipart: false,
            arguments: { }
        };
    }

    private array function parsePath( required string path ) {
        return arrayMap( reMatchNoCase( '\{([a-z_]+)\}', path ), function( s ) {
            return mid( s, 2, len( s ) - 2 );
        } );
    }

}
