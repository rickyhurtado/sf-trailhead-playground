@isTest
public class ParkLocatorTest {
    @isTest static void testCallout() {              
        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        List<String> parkList = new List<String>();

		parkList.add('Hamburg Wadden Sea National Park');
        parkList.add('Hainich National Park');
        parkList.add('Bavarian Forest National Park');

        List<String> parkListResult = ParkLocator.country('name of country');

        // Verify that a fake result is returned
        System.assertEquals(parkList, parkListResult); 
    }
}