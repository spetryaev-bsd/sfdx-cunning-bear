@IsTest
public class AnimalLocatorTest {
	@isTest static void testPostCalloutOK() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String actualValue = AnimalLocator.getAnimalNameById(1);
        // Verify that the response received contains fake values
        String expectedValue = 'chicken';
        System.assertEquals(expectedValue, actualValue);
	}
    
    @isTest static void testPostCalloutERROR() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String actualValue = AnimalLocator.getAnimalNameById(666);
        // Verify that the response received contains fake values
        String expectedValue = null;
        System.assertEquals(expectedValue, actualValue);
     
	}
}