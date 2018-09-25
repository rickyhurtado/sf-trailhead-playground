public class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String stateShort;
    
    public AddPrimaryContact(Contact contact, String stateShort) {
        this.contact    = contact;
        this.stateShort = stateShort;
    }

    public void execute(QueueableContext context) {
        List<Account> accounts = [SELECT BillingState
                                  FROM Account
                                  WHERE BillingState = :stateShort
                                  LIMIT 200];

        List<Contact> contacts = new List<Contact>();

        for (Account account : accounts) {
            Contact newContact = contact.clone(false, false, false, false);

            newContact.AccountId = account.Id;
            contacts.add(newContact);
        }
        
        insert contacts;
    }
}