global class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds) {
        for (Id accountId: accountIds) {
            Account account = [SELECT Number_of_Contacts__c
                               FROM Account
                               WHERE Id=:accountId];

            List<Contact> contacts = [SELECT Id
                                      FROM Contact
                                      WHERE AccountId=:accountId];

            account.Number_of_Contacts__c = contacts.size();
            
            update account;
            
            System.debug('Number of Contacts: ' + account.Number_of_Contacts__c);
        }
    }
}