@IsTest
public class AccountProcessorTest {
	@IsTest
    public static void countContactsTest() {
        List<Account> accounts = TestDataFactory.createAccountsWithContacts(2, 3);
		List<Id> accountIds = new List<id>();
        
        for (Account account : accounts) {
            accountIds.add(account.Id);
        }
        
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
        for (Account account : accounts) {
            Account updatedAccount = [SELECT Number_of_Contacts__c
                               FROM Account
                               WHERE Id=:account.Id];
            
            System.assertEquals(updatedAccount.Number_of_Contacts__c, 3);
        }
    }
}