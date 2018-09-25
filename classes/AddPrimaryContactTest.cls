@isTest
public class AddPrimaryContactTest {
	@testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();

        for (Integer i = 0; i < 100; i++) {
            Account account = new Account(
                name='Account' + i
            );

            if (i < 50) {
                account.BillingState = 'NY';
            } else {
                account.BillingState = 'CA';
            }

            accounts.add(account);
        }

        insert accounts;
    }

    static testmethod void testQueueable() {
        Contact contact = new Contact(
            LastName = 'Primary Contact'
        );

        AddPrimaryContact addPrimaryContact = new AddPrimaryContact(contact, 'CA');
        
        Test.startTest();        
	        System.enqueueJob(addPrimaryContact);
        Test.stopTest();        

		System.assertEquals(50, [SELECT count()
                                 FROM Contact
                                 WHERE accountID
                                 IN (
                                     SELECT Id
                                     FROM Account
                                     WHERE BillingState = 'CA'
                                 )
                                ]); 
    }
}