public with sharing class AnimalLocator {

    public static String getAnimalNameById(Integer id)
    {   
        Http http = new Http();
        string resp = '';
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> lista = (Map<String, Object>) results.get('animal');
            System.debug(':' + lista.get('name'));
            resp = (String)lista.get('name');
        }
        return resp;
}
}
