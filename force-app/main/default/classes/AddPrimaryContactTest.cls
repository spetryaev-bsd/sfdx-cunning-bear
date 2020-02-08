@IsTest
public class AddPrimaryContactTest {
	
    @testSetup
    static void setup(){
        List<Account> nyAccs = new List<Account>();
        List<Account> caAccs = new List<Account>();
        for(Integer i = 0; i < 50; i++){
            nyAccs.add(new Account(Name = 'testAcc', BillingState = 'NY'));
            caAccs.add(new Account(Name = 'testAcc', BillingState = 'CA'));
        }
        insert nyAccs;
        insert caAccs;
    }
    
    static testmethod void testQueueable(){
        AddPrimaryContact adder = new AddPrimaryContact(new Contact(LastName='Powers'), 'CA');
        Test.startTest();
        System.enqueueJob(adder);
        Test.stopTest();
        List<Account> accs = [SELECT Id, Name, BillingState, (SELECT LastName FROM Contacts)
                              FROM Account 
                              WHERE BillingState='CA'];
        for(Account acc: accs){
            System.assert(acc.Contacts.size() > 0);
        }
    }
}