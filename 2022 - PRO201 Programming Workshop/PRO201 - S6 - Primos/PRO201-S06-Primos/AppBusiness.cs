namespace PRO201_S06_Primos
{
    internal class AppBusiness
    {
        // Init our AppData class
        AppData appData = new AppData();
        
        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            // To customize application configuration such as set high DPI settings or default font,
            // see https://aka.ms/applicationconfiguration.
            ApplicationConfiguration.Initialize();
            Application.Run(new AppPresentation());
        }
        
        // Process the option and pass it to the AppData class
        public List<string> ProcessOption(string option)
        {
            // Fail safe for ranges
            int range_start = 0;
            int range_end = 0;
            
            // Switch statement to set our ranges
            switch (option)
                {
                    case "1 a 99":
                        range_start = 1;
                        range_end = 99;
                        break;
                    case "100 a 999":
                        range_start = 100;
                        range_end = 999;
                        break;
                    case "1000 a 9999":
                        range_start = 1000;
                        range_end = 9999;
                        break;
                    case "10000 a 99999":
                        range_start = 10000;
                        range_end = 99999;
                        break;
                    case "100000 a 999999":
                        range_start = 100000;
                        range_end = 999999;
                        break;
                    case "1000000 a 1999999":
                        range_start = 1000000;
                        range_end = 1999999;
                        break;
                    default:
                        range_start = 1;
                        range_end = 99;
                        break;
                }
            
            // Retrieve an Array of all the prime numbers between the range
            List<int> primeNumbers = appData.FindPrimeNumbers(range_start, range_end);
            
            // Prepare a new Array to be inserted as row into our dataGrid table
            List<string> rowData = new List<string>();
            
            // Add range_start and range_end to the Array
            rowData.Add(range_start.ToString());
            rowData.Add(range_end.ToString());
            
            // Add the lowest prime number to the Array (start at 1, because index 0 is our execution time)
            rowData.Add(primeNumbers[1].ToString());
            
            // Add the highest prime number to the Array
            rowData.Add(primeNumbers[primeNumbers.Count - 1].ToString());
            
            // Get the total number of prime numbers in primeNumbers (minus 1 for our execution time at index 0)
            rowData.Add((primeNumbers.Count - 1).ToString());
            
            // Get primeNumbers execution time (located at index 0)
            rowData.Add(primeNumbers[0].ToString());
            
            // Observations, ok? no errors
            rowData.Add("OK");
            
            // Return rowData to AppPresentation class for display
            return rowData;
        }
    }
}