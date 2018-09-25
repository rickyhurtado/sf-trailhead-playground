@isTest
public class TestDataFactory {
    public static List<Account> createAccountsWithContacts(
        Integer numberOfAccounts,
        Integer numberOfContactsPerAccount
    ) {
        List<Account> accounts = new List<Account>();
        
        for(Integer i=0; i<numberOfAccounts; i++) {
            Account a = new Account(Name='Test Account ' + i);
            accounts.add(a);
        }
        
        insert accounts;
        
        List<Contact> contacts = new List<Contact>();

        for (Integer j=0; j<numberOfAccounts; j++) {
            Account account = accounts[j];

            for (Integer k=0; k<numberOfContactsPerAccount; k++) {
                contacts.add(
                    new Contact(
                        FirstName = 'Test Contact',
                        LastName  = 'Name ' + k,
                        AccountId = account.Id
                	)
                );
            }
        }

        insert contacts;
        
        return accounts;
    }

    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) {
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        List<Opportunity> opps = new List<Opportunity>();
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            // For each account just inserted, add opportunities
            for (Integer k=0;k<numOppsPerAcct;k++) {
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert opps;
        
        return accts;
    }
}