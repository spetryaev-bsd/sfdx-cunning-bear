@IsTest
public class LeadProcessorTest {
	
    @testSetup
    static void testLeadProcessorBatch(){
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0; i < 200; i++){
            leads.add(new Lead(LastName='Lead' + i, LeadSource='Web', Company='None of your business'));
        }
        insert leads;
        System.debug('Number of test leads: ' + leads.size());
    }
    
    static testmethod void test(){
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        List<Lead> leads = [SELECT Id, LeadSource FROM Lead];
        for(Lead lead: leads){
            System.assertEquals('Dreamforce', lead.LeadSource);
        }
    }
}