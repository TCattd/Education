using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PRO201_S06_Primos
{
    internal class AppData
    {
        // Process the given range and find all the prime numbers between the given range
        public List<int> FindPrimeNumbers(int start, int end)
        {
            // Timer to get the method execution time
            Stopwatch timer = Stopwatch.StartNew();
            
            // List to store the prime numbers
            List<int> primes = new List<int>();

            for (int i = start; i <= end; i++)
            {
                if (IsPrimeNumber(i))
                {
                    // Prime number found, add it to the list
                    primes.Add(i);
                }
            }

            // Stop the timer
            timer.Stop();
            
            // Get the elapsed time as a TimeSpan value.
            TimeSpan timespan = timer.Elapsed;

            // Add execution time in milliseconds, as the first element of the list
            primes.Insert(0, (int)timespan.TotalMilliseconds);
            
            // Return the list of prime numbers (plus execution time at index 0)
            return primes;
        }
        
        // Check if the given number is prime or not
        private bool IsPrimeNumber(double number)
        {
            // We don't need to waste time in calculations for 1 or 2
            if (number == 1) return false;

            if (number == 2) return true;

            // Limit our calculations until the number's square root
            // As stated here https://blogs.elespectador.com/actualidad/ecuaciones-de-opinion/saber-numero-primo
            // So we use less calculations overall
            var limit = Math.Ceiling(Math.Sqrt(number));

            // And then, calculate using "brute force"
            for (double i = 2; i <= limit; i++)
            {
                // If the remainder is 0, then the number is not a prime one
                if (number % i == 0)
                {
                    return false;
                }
            }
        
            // Passes all previous tests, should be a prime number
            return true;
        }
    }
}
