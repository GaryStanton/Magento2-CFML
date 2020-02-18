component accessors="true" {

    property name="formatterUtil" inject="Formatter";

    function run() {
        organizeResources();
        organizeMetadata();
    }

    function organizeResources() {
        var resourcePath = resolvePath( 'lib/resources/' );
        var resources = directoryList( resourcePath, true, 'path', '*.cfc' ).sort( 'text' );

        for ( var srcPath in resources ) {
            var relativePath = srcPath.replace( resourcePath, '' ).replace( '\', '/', 'all' );

            var srcCode = fileRead( srcPath, 'utf-8' );
            var meta = loadMetadata( srcCode );

            if ( !isNull( meta ) ) {
                print.line( 'Organizing #relativePath#' );
                fileWrite( srcPath, organize( srcCode, meta ), 'utf-8' );
            }
        }
    }

    function organizeMetadata() {
        var metadataPath = resolvePath( './metadata/' );
        var md = directoryList( metadataPath, true, 'path', '*.json' ).sort( 'text' );

        for ( var srcPath in md ) {
            var relativePath = srcPath.replace( metadataPath, '' ).replace( '\', '/', 'all' );
            print.line( 'Organizing #relativePath#' );
            var src = fileRead( srcPath, 'utf-8' );
            var formatted = formatterUtil.formatJson( json = src, spaceAfterColon = true, sortKeys = 'text' );
            fileWrite( srcPath, formatted & server.separator.line, 'utf-8' );
        }
    }

    function organize( srcCode, meta ) {
        var patternClass = createObject( 'java', 'java.util.regex.Pattern' );
        var quoteKeyRegex = patternClass.compile( '"([A-Za-z_]+)"\s*:' );
        var methodNameRegex = patternClass.compile( '\n\s{8}([A-Za-z]+):' );

        var formattedMeta = formatterUtil.formatJson( json = meta.data, spaceAfterColon = true, sortKeys = 'text' );
        formattedMeta = quoteKeyRegex
            .matcher( formattedMeta )
            .replaceAll( '$1:' )
            .replace( '"', '''', 'all' );
        formattedMeta = methodNameRegex
            .matcher( formattedMeta )
            .replaceAll( '#chr( 10 )#        ''$1'':' )
            .replace( '#chr( 10 )#', '#chr( 10 )#    ', 'all' );

        return srcCode.replace( meta.raw, formattedMeta );
    }

    function loadMetadata( srcCode ) {
        var patternClass = createObject( 'java', 'java.util.regex.Pattern' );
        var unquoteKeyRegex = patternClass.compile( '\b([A-Za-z_]+)\s*:' );
        var metaRegex = patternClass.compile( 'this\.metadata\s*=\s*(\{.*?\n\s{4}\})', 32 );
        var metaMatcher = metaRegex.matcher( srcCode );
        if ( metaMatcher.find() ) {
            var rawMeta = metaMatcher.group( 1 );
            var meta = unquoteKeyRegex
                .matcher( rawMeta )
                .replaceAll( '"$1":' )
                .replace( '''', '"', 'all' );
            return {
                raw: rawMeta,
                data: deserializeJSON( meta )
            }
        }
    }
}
