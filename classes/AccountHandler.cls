public class AccountHandler {
	public static Account insertNewAccount(String name) {
        try {
            Account account = new Account(Name=name);
            
            insert account;
            
            return account;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' + e.getMessage());
            
            return null;
        }
    }
}