@isTest
public class AnimalLocatorTest {
    @isTest static void testAnimalLocator() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 

        String animalName = AnimalLocator.getAnimalNameById(1);
        
        System.assertEquals(animalName, 'dog');
    }
}