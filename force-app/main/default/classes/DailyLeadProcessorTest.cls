@IsTest
public class DailyLeadProcessorTest {
    
	public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void test(){
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0; i < 200; i++){
            Lead l = new Lead(
            LastName = 'Lead ' + i,
            Company = 'Da Best of Da Best Co.');
            leads.add(l);
        }
        insert leads;
        Test.startTest();
        String jobId = System.schedule('Daily Lead Processor', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        List<Lead> testLeads = [SELECT Id, LeadSource 
                            FROM Lead  
                            LIMIT 200];
        for(Lead lead: testLeads){
            System.assertEquals('Dreamforce', lead.LeadSource);
        }
    }
}