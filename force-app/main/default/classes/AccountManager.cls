@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
	@HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accId = request.requestURI.substringBetween('Accounts/', '/contacts');
        System.debug(accId);
        Account acc = [SELECT ID, Name, (SELECT ID, Name FROM Contacts) 
                       FROM Account 
                       WHERE ID = :accId];
        System.debug('This is a change');
        System.debug('This is another change');
        return acc;
    }
    
 
    
}
