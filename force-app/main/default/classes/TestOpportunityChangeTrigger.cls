@isTest
public class TestOpportunityChangeTrigger {
	
    @isTest
    public static void testCreateAndUpdateOpportunity(){
        Test.enableChangeDataCapture();
        
        Opportunity opp = new Opportunity(
        	Name='Sell 100 Widgets',
            StageName='Prospecting',
            CloseDate=Date.today().addMonths(3)
        );
        insert opp;
        
        Test.getEventBus().deliver();
        
        Opportunity oppToUpdate = [SELECT Id, StageName FROM Opportunity WHERE Id=:opp.Id];
        oppToUpdate.StageName = 'Closed Won';
        update oppToUpdate;
        
        Test.getEventBus().deliver();
        
        List<Task> tasks = [SELECT Id, Subject FROM Task];
        System.assertEquals(1, tasks.size());
        
    }
}