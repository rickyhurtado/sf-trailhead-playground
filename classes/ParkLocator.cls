public class ParkLocator {
    public static List<String> country(String countryName) {
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();

		List<String> parkList = parks.byCountry(countryName);

        return parkList;
    }
}