@IsTest
public with sharing class WorkflowRuleTest {
	
    @IsTest
    private static void testUpdateAccount(){
        
        Account acc = new Account(Name='CreatedAcc', AccountSource = 'Other', Active__c = 'Yes');
        insert acc;
        System.debug([SELECT Name, AccountSource, Active__c FROM Account WHERE Id = :acc.Id]);
        acc.AccountSource = 'Web';
        Test.startTest();
        update acc;
        Test.stopTest();
        System.debug([SELECT Name, AccountSource, Active__c FROM Account WHERE Id = :acc.Id]);
    }
    
   
}