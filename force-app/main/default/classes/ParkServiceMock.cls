@IsTest
global class ParkServiceMock implements WebServiceMock {
    global void doInvoke(
               Object stub,
               Object request,
               Map<String, Object> response,
               String endpoint,
               String soapAction,
               String requestName,
               String responseNS,
               String responseName,
               String responseType) {
            // start - specify the response you want to send
            
            ParkService.byCountryResponse response_x = 
                new ParkService.byCountryResponse();
            String countryArg = ((ParkService.byCountry) request).arg0;
            List<String> parks = new List<String>();
            if(countryArg == 'Japan'){
                parks.add('Tokyo Park');
            	parks.add('Osaka Park');      
            } else if(countryArg == 'Germany'){
                parks.add('Octoberfest National Park');
            } else if(countryArg == 'United States'){
                parks.add('NYC Central Park');
            	parks.add('Sweet Home Alabama'); 
            }    
            
            response_x.return_x = parks;
            // end
            response.put('response_x', response_x); 
      }
}