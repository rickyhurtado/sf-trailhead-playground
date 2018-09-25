@IsTest
private class AccountManagerTest {
    @isTest static void testGetAccount() {
        Id recordId = createTestRecord();

        RestRequest request = new RestRequest();

        String accountsUri = 'https://yourInstance.salesforce.com/services/apexrest/Accounts/';
        
        request.requestUri = accountsUri + recordId + '/contacts';
        request.httpMethod = 'GET';

        RestContext.request = request;

        Account account = AccountManager.getAccount();
        
        System.debug(account);
        System.assert(account != null);
        System.assertEquals(account.Name, 'Account Name');
        System.assertEquals(account.Contacts.size(), 2);
        System.assertEquals(account.Contacts[0].Name, 'Contact Name 1');
        System.assertEquals(account.Contacts[1].Name, 'Contact Name 2');
    }

    static Id createTestRecord() {
        Account account = new Account(Name='Account Name');
        insert account;
        
        List<Contact> contacts = new List<Contact>();
        
        contacts.add(new Contact(
            AccountId = account.id,
            FirstName = 'Contact',
            LastName  = 'Name 1'
        ));

        contacts.add(new Contact(
            AccountId = account.id,
            FirstName = 'Contact',
            LastName  = 'Name 2'
        ));

        insert contacts;
        
        return account.Id;
    }          
}