using Dapper;
using System.Configuration;
using System.Data;
using System.Data.SQLite;

namespace PRO201_ENE_Registro_Requerimientos
{
    internal class AppData
    {
        // Attributes
        private string? username;
        private readonly int userId;
        private string? type;

        // Check if username exists
        public bool UserExists(string username)
        {
            using (IDbConnection connection = new SQLiteConnection(LoadConnectionString()))
            {
                var output = connection.Query("select * from users where user = @Username", new { Username = username }).ToList();
                
                return output.Count != 0;
            }
        }
        
        // Get hashed password for username
        public string GetHashedPassword(string username)
        {
            using (IDbConnection connection = new SQLiteConnection(LoadConnectionString()))
            {
                var output = connection.Query("select password from users where user = @Username", new { Username = username }).ToList();
                
                return output[0].password;
            }
        }
        
        // Mark user as blocked, set attempts column to 1
        public void BlockUser(string username)
        {
            using (IDbConnection connection = new SQLiteConnection(LoadConnectionString()))
            {
                connection.Execute("update users set attempts = 1 where user = @Username", new { Username = username });
            }
        }
        
        // Reset user attempts column to 0
        public void ResetUserAttempts(string username)
        {
            using (IDbConnection connection = new SQLiteConnection(LoadConnectionString()))
            {
                connection.Execute("update users set attempts = 0 where user = @Username", new { Username = username });
            }
        }
        
        // Check if user is blocked
        public bool IsUserBlocked(string username)
        {
            using (IDbConnection connection = new SQLiteConnection(LoadConnectionString()))
            {
                var output = connection.Query("select attempts from users where user = @Username", new { Username = username }).ToList();
                
                return output[0].attempts == 1;
            }
        }
        
        // Get user name from id
        private string GetUserName(int userId)
        {
            using (IDbConnection connection = new SQLiteConnection(LoadConnectionString()))
            {
                var output = connection.Query("select name from users where id = @userId limit 1", new { userId });
                
                // If there is a result, return the name
                if (output.Count() > 0)
                {
                    return output.First().name;
                }
                else
                {
                    return "NN";
                }
            }
        }
        
        // Get user id from user name
        public int GetUserId(string username)
        {
            using (IDbConnection connection = new SQLiteConnection(LoadConnectionString()))
            {
                var output = connection.Query("select id from users where user = @username limit 1", new { username });
                
                // If there is a result, return the id
                if (output.Count() > 0)
                {
                    return Convert.ToInt32(output.First().id);
                }
                else
                {
                    return 0;
                }
            }
        }
        
        // DB connection string
        private static string LoadConnectionString(string id = "Default")
        {
            return ConfigurationManager.ConnectionStrings[id].ConnectionString;
        }
    }
}