@IsTest
public class AccountProcessorTest {
	
    @IsTest
    private static void testCountContacts(){   
 		Account accToAdd = new Account(Name='TestAcc');
        insert accToAdd;
        
        List<Contact> contacts = new List<Contact>();
        Contact c1 = new Contact(LastName='TestContact1', AccountId = accToAdd.Id);
        Contact c2 = new Contact(LastName='TestContact2', AccountId = accToAdd.Id);
        contacts.add(c1);
        contacts.add(c2);
        
        insert contacts;
        
        List<Id> accIds = new List<Id>();
        accIds.add(accToAdd.Id);
        
		
        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();
        List<Account> acc = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id = :accToAdd.Id];
        
        System.assertEquals(contacts.size(), acc.get(0).Number_of_Contacts__c);
        
    }
}