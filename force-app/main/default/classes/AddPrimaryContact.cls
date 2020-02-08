public class AddPrimaryContact implements Queueable{

    private Contact c;
    private String state;
    
    public AddPrimaryContact(Contact c, String state){
        this.c = c;
        this.state = state;
    }
    
    
    public void execute(QueueableContext context){
        List<Account> accs = [SELECT Id, Name FROM Account Where BillingState = :this.state LIMIT 200];
        for(Account acc: accs){
            Contact accContact =  c.clone(false);
           	accContact.AccountId = acc.Id;
            insert accContact;
        }
    }
    
}