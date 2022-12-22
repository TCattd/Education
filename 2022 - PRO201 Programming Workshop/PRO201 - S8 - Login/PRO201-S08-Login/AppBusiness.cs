using System.Security.Cryptography;
using System.Text;

namespace PRO201_ENE_Registro_Requerimientos
{
    internal class AppBusiness
    {
        // Attributes
        public int userId;
        public string userRole;
        public string username;
        private string password;
        private AppData appData = new AppData();

        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            // To customize application configuration such as set high DPI settings or default font,
            // see https://aka.ms/applicationconfiguration.
            ApplicationConfiguration.Initialize();
            Application.Run(new LoginForm());
        }

        // Constructor
        public AppBusiness()
        {
        }

        // Validate user credentials
        public int ValidateUser(string username, string password)
        {
            // Check if the username doesn't exists
            if (!appData.UserExists(username))
            {
                return 0;
            }

            // Get hashed password for the given username
            string hashedStoredPassword = appData.GetHashedPassword(username);

            // Hash the given password to SHA256
            string hashedGivenPassword = CalculateSha256Hash(password);

            // Check password
            if (hashedGivenPassword != hashedStoredPassword)
            {
                return 0;
            }

            // Get user id
            int userId = appData.GetUserId(username);

            return userId;
        }

        // Blocks user account
        public void BlockUser(string username)
        {
            appData.BlockUser(username);
        }

        // Reset user attempts
        public void ResetUserAttempts(string username)
        {
            appData.ResetUserAttempts(username);
        }

        // Check if user is blocked
        public bool IsUserBlocked(string username)
        {
            return appData.IsUserBlocked(username);
        }
        
        static string CalculateSha256Hash(string plainText)
        {
            // Create a SHA256 hash from string   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // Computing Hash - returns here byte array
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(plainText));

                // now convert byte array to a string   
                StringBuilder stringbuilder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    stringbuilder.Append(bytes[i].ToString("x2"));
                }
                return stringbuilder.ToString();
            }
        }
    }
}