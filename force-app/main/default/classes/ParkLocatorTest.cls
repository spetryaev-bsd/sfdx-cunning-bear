@IsTest
public class ParkLocatorTest {
    @IsTest static void test(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
    	System.debug(ParkLocator.country('Japan'));
        System.debug(ParkLocator.country('United States'));
    }
}