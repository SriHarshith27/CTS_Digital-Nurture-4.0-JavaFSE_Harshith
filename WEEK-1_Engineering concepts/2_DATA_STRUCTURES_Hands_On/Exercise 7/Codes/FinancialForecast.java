public class FinancialForecast {

    // Recursive method to compute future value
    public static double forecast(double presentValue, double rate, int years) {
        if (years == 0) {
            return presentValue;
        }
        return forecast(presentValue * (1 + rate), rate, years - 1);
    }

    // Optimized version using exponentiation
    public static double optimizedForecast(double presentValue, double rate, int years) {
        return presentValue * Math.pow(1 + rate, years);
    }

    public static void main(String[] args) {
        double initialInvestment = 10000; // ₹10,000
        double annualGrowthRate = 0.10;   // 10%
        int forecastYears = 5;

        System.out.println("📊 Recursive Forecast:");
        double result = forecast(initialInvestment, annualGrowthRate, forecastYears);
        System.out.printf("Future value (recursive): ₹%.2f%n", result);

        System.out.println("\n⚡ Optimized Forecast (using Math.pow):");
        double optimized = optimizedForecast(initialInvestment, annualGrowthRate, forecastYears);
        System.out.printf("Future value (optimized): ₹%.2f%n", optimized);
    }
}
