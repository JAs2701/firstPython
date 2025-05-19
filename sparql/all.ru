# delete all P3_has_note, everywhere
PREFIX crm: <http://www.cidoc-crm.org/cidoc-crm/>
PREFIX vocab: <http://vocab.performing-arts.ch/>
PREFIX spao: <http://ontology.performing-arts.ch/>
PREFIX a: <http://data.performing-arts.ch/a/>
PREFIX e: <http://data.performing-arts.ch/e/>
PREFIX o: <http://data.performing-arts.ch/o/>
PREFIX p: <http://data.performing-arts.ch/p/>
PREFIX r: <http://data.performing-arts.ch/r/>
PREFIX u: <http://data.performing-arts.ch/u/>
PREFIX w: <http://data.performing-arts.ch/w/>
PREFIX x: <http://data.performing-arts.ch/x/>
PREFIX olo: <http://purl.org/ontology/olo/core#>
Delete
Where {
    ?s crm:P3_has_note ?o .
}
;

# delete all rdfs:comment, everywhere
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
Delete
Where { 
    ?s rdfs:comment ?o .
}
;

# delete all LDP containers with all their dates
PREFIX ldp: <http://www.w3.org/ns/ldp#>
Delete { ?s ?p ?o }
Where {
    ?s a ldp:Resource .
    ?s ?p ?o .
    FILTER(CONTAINS(str(?s),"/container"))    
}
;

# delete the metaphacts formContainer
Delete
Where {
    <http://www.metaphacts.com/ontologies/platform#formContainer> ?p ?o .
    ?s ?p ?o .
}
;

# delete all archival places
Delete 
{
    ?s ?p ?o
}
Where {
    ?s a <http://ontology.performing-arts.ch/ArchivalPlace> .
    ?s ?p ?o .
}
;

# delete all location information to archival places
prefix rico: <https://www.ica.org/standards/RiC/ontology#>
Delete
Where {
    ?s rico:hasOrHadLocation ?o .
}