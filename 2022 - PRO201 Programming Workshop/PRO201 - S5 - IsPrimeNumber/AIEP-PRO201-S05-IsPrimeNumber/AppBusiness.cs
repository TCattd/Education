using AIEP_PRO201_S05_IsPrimeNumber_Data;

namespace AIEP_PRO201_S05_IsPrimeNumber_Business;

public class AppBusiness
{
    private AppData appData = new AppData();

    public int numberToEvaluate
    {
        get;
        set;
    }

    public bool checkIfPrimeNumber()
    {
        return appData.isPrimeNumber(numberToEvaluate);
    }
    
    // Method to check if a valid number has been entered
    public bool IsNumber(string numberText)
    {
        // Check if numberText is a number
        int number;
            
        return int.TryParse(numberText, out number);
    }

}