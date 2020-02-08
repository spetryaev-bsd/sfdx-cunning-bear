@IsTest
global class AnimalLocatorMock implements HttpCalloutMock {
// Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        if (request.getEndpoint().contains('666')){
            response.setStatusCode(500);
        } else{
            response.setStatusCode(200);
        }
        return response; 
    }
}