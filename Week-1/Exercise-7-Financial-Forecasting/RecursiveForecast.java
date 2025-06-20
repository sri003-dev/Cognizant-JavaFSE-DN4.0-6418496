public class RecursiveForecast {

    public static double forecastValue(double currentValue, double growthRate, int years) {
        if (years == 0) {
            return currentValue;
        }
        return forecastValue(currentValue * (1 + growthRate), growthRate, years - 1);
    }

    public static double forecastMemoized(double currentValue, double growthRate, int years, Double[] memo) {
        if (years == 0) return currentValue;
        if (memo[years] != null) return memo[years];
        memo[years] = forecastMemoized(currentValue, growthRate, years - 1, memo) * (1 + growthRate);
        return memo[years];
    }

    public static void main(String[] args) {
        double currentValue = 10000;
        double growthRate = 0.08;
        int years = 5;

        double futureValue = forecastValue(currentValue, growthRate, years);
        System.out.println("Forecast (recursive): " + futureValue);

        Double[] memo = new Double[years + 1];
        double futureValueMemo = forecastMemoized(currentValue, growthRate, years, memo);
        System.out.println("Forecast (memoized): " + futureValueMemo);
    }
}
