public class ParkLocator {
    public static String[] country(String country){
        ParkService.ParksImplPort ps = new ParkService.ParksImplPort();
		return ps.byCountry(country);
    }
}