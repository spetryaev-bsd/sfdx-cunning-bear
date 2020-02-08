@IsTest
private class AccountManagerTest {
	@isTest static void testGetAccount() {
        Account objAccount = new Account(Name = 'Test Account');
        insert objAccount;
        Contact objContact = new Contact(LastName = 'Test Contact', AccountId = objAccount.Id);
        insert objContact;
        
        Id recordId = objAccount.Id;
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://cunning-bear-cd8vns-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + recordId
            + '/contacts';
        System.debug(request.requestUri);
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account acc = AccountManager.getAccount();
        // Verify results
        System.assert(acc != null);
        System.assertEquals('Test Account', acc.Name);
    }
    
    
  
}