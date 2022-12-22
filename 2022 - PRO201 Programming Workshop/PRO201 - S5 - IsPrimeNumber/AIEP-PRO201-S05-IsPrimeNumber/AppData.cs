namespace AIEP_PRO201_S05_IsPrimeNumber_Data;

public class AppData
{
    public bool isPrimeNumber(int number)
    {
        if (number == 1) return false;
        if (number == 2) return true;

        var limit = Math.Ceiling(Math.Sqrt(number));

        for (int i = 2; i <= limit; ++i)
        {
            if (number % i == 0)
            {
                return false;
            }
        }
        
        return true;
    }
}