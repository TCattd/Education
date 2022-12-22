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
            if ( hashedGivenPassword != hashedStoredPassword )
            {
                return 0;
            }
            
            // Get user id
            int userId = appData.GetUserId(username);
            
            return userId;
        }

        // Get requirements using AppData, and send it to our view
        public List<List<string>> GetInitialRequirements(int userId, string userRole)
        {
            // Get ListRequirements from AppData
            List<List<string>> requirements = appData.GetInitialRequirements(userId, userRole);
            
            // Send requirements to our view
            return requirements;
        }
        
        // Get requirements by parameters, using AppData, and send it to our view
        public List<List<string>> GetRequirements(int userId, string userRole, string type, string priority, string status)
        {
            // Get ListRequirements from AppData
            List<List<string>> requirements = appData.GetRequirements(userId, userRole, type, priority, status);
            
            // Send requirements to our view
            return requirements;
        }
        
        // Update requirement status using AppData
        public bool UpdateRequerimentStatus(int id, string status)
        {
            // If status is not Pendiente or Resuelto, return false
            if (status != "Pendiente" && status != "Resuelto")
            {
                return false;
            }
            
            // Update requirement status using AppData
            var result = appData.UpdateRequirementStatus(id, status);

            return result;
        }
        
        // Delete requirement using AppData
        public bool DeleteRequirementById(int id)
        {
            // Delete requirement using AppData
            var result = appData.DeleteRequirementById(id);

            return result;
        }
        
        // Retrieve all users using AppData
        public List<List<string>> GetAllUsers()
        {
            // Get ListUsers from AppData
            List<List<string>> users = appData.GetAllUsers();
            
            // Send users to our view
            return users;
        }
        
        // Save new requirement using AppData
        public bool SaveRequirement(string type, int user, string description, string priority, string status)
        {
            // Save new requirement using AppData
            bool result = appData.SaveRequirement(type, user, description, priority, status);

            return result;
        }
        
        // Get user roles using AppData
        public string GetUserRole(int userId)
        {
            string role = appData.GetUserRole(userId);
            
            return role;
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