using Dapper;
using System.Configuration;
using System.Data;
using System.Data.SQLite;

namespace PRO201_ENE_Registro_Requerimientos
{
    internal class AppData
    {
        // Attributes
        private string? queryLimit;
        private string? username;
        private readonly int userId;
        private string? userRole;
        private string? type;
        private string? priority;
        private string? status;
        private string? description;

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
        
        // Retrieve a list of all the requirements from SQLite database
        public List<List<string>> GetInitialRequirements(int userId, string userRole)
        {
            using (IDbConnection connection = new SQLiteConnection(LoadConnectionString()))
            {
                // If role is admin, retrieve all requirements
                if (userRole == "admin")
                {
                    queryLimit = "AND assigned LIKE '%'";
                }
                
                // If role is user, retrieve only assigned requirements
                else
                {
                    queryLimit = "AND assigned = @UserId";
                }
                
                var output = connection.Query("select * from requirements where status = 'Pendiente' " + queryLimit, new { UserId = userId }).ToList();
                
                //var output = connection.Query("select * from requirements where status = 'Pendiente'", new DynamicParameters());
                
                // Create a new multidimensional list to store the requirements
                List<List<string>> requirementsList = new List<List<string>>();
                
                // Counter
                int i = 0;

                // Add each requirement to the list
                foreach (var item in output)
                {
                    // convert user id to user name
                    string userName = GetUserName(Convert.ToInt32(item.assigned));
                    
                    requirementsList.Add(new List<string>());
                    requirementsList[i].Add(item.id.ToString());
                    requirementsList[i].Add(item.type.ToString());
                    requirementsList[i].Add(item.priority.ToString());
                    requirementsList[i].Add(item.description.ToString());
                    requirementsList[i].Add(userName);
                    requirementsList[i].Add(item.status.ToString());
                    
                    // Days remaining using DaysRemaining
                    requirementsList[i].Add(DaysRemaining(item.priority.ToString()));
                    
                    i++;
                }
                
                // Return the list of requirements
                return requirementsList;
            }
        }
        
        // Retrieve all the requirements from SQLite database, with given parameters
        public List<List<string>> GetRequirements(int userId, string userRole, string type, string priority, string status)
        {
            using (IDbConnection connection = new SQLiteConnection(LoadConnectionString()))
            {
                // If type is "Todos", then include all types
                if (type == "Todos")
                {
                    type = "type LIKE '%'";
                }
                else
                {
                    type = "type = '" + type + "'";
                }
                
                // If priority is "Todas", then include all priorities
                if (priority == "Todas")
                {
                    priority = "priority LIKE '%'";
                }
                else
                {
                    priority = "priority = '" + priority + "'";
                }
                
                // If status is "Cualquiera", then include all statuses
                if (status == "Cualquiera")
                {
                    status = "status LIKE '%'";
                }
                else
                {
                    status = "status = '" + status + "'"; 
                }
                
                // If role is admin, retrieve all requirements
                if (userRole == "admin")
                {
                    queryLimit = "AND assigned LIKE '%'";
                }
                
                // If role is user, retrieve only assigned requirements
                else
                {
                    queryLimit = "AND assigned = " + userId;
                }

                var output = connection.Query("select * from requirements where " + type + " and " + priority + " and " + status + " " + queryLimit, new DynamicParameters());
                
                // Create a new multidimensional list to store the requirements
                List<List<string>> requirementsList = new List<List<string>>();
                
                // Counter
                int i = 0;

                // Add each requirement to the list
                foreach (var item in output)
                {
                    // convert user id to user name
                    string userName = GetUserName(Convert.ToInt32(item.assigned));
                    
                    requirementsList.Add(new List<string>());
                    requirementsList[i].Add(item.id.ToString());
                    requirementsList[i].Add(item.type.ToString());
                    requirementsList[i].Add(item.priority.ToString());
                    requirementsList[i].Add(item.description.ToString());
                    requirementsList[i].Add(userName);
                    requirementsList[i].Add(item.status.ToString());
                    
                    // Days remaining using DaysRemaining
                    requirementsList[i].Add(DaysRemaining(item.priority.ToString()));
   
                    i++;
                }
                
                // Return the list of requirements
                return requirementsList;
            }
        }
        
        // Update requirement status
        public bool UpdateRequirementStatus(int id, string status)
        {
            using (IDbConnection connection = new SQLiteConnection(LoadConnectionString()))
            {
                int rowsAffected = connection.Execute("update requirements set status = @Status where id = @Id limit 1", new { Status = status, Id = id });
                
                return rowsAffected > 0;
            }
        }
        
        // Delete requirement by id
        public bool DeleteRequirementById(int id)
        {
            using (IDbConnection connection = new SQLiteConnection(LoadConnectionString()))
            {
                int rowsAffected = connection.Execute("delete from requirements where id = @Id limit 1", new { Id = id });
                
                return rowsAffected > 0;
            }
        }
        
        // Get user name from id
        private string GetUserName(int id)
        {
            using (IDbConnection connection = new SQLiteConnection(LoadConnectionString()))
            {
                var output = connection.Query("select name from users where id = @id limit 1", new { id });
                
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
        
        // Get all users from the db
        public List<List<string>> GetAllUsers()
        {
            using (IDbConnection connection = new SQLiteConnection(LoadConnectionString()))
            {
                var output = connection.Query("select id, name from users", new DynamicParameters());
                
                // Create a new list to store the users
                List<List<string>> usersList = new List<List<string>>();
                
                // Counter
                int i = 0;

                foreach (var item in output)
                {
                    usersList.Add(new List<string>());
                    usersList[i].Add(item.id.ToString());
                    usersList[i].Add(item.name.ToString());
                    
                    i++;
                }
                
                // Return the list of users
                return usersList;
            }
        }
        
        // Save a new requirement to the db
        public bool SaveRequirement(string type, int user, string description, string priority, string status)
        {
            using (IDbConnection connection = new SQLiteConnection(LoadConnectionString()))
            {
                int rowsAffected = connection.Execute("insert into requirements (type, priority, description, assigned, status) values (@type, @priority, @description, @user, @status)", new { Type = type, Priority = priority, Description = description, User = user, Status = status });
                
                return rowsAffected > 0;
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
        
        // Get user role from id
        public string GetUserRole(int id)
        {
            using (IDbConnection connection = new SQLiteConnection(LoadConnectionString()))
            {
                var output = connection.Query("select role from users where id = @id limit 1", new { id });
                
                // If there is a result, return the role
                if (output.Count() > 0)
                {
                    return output.First().role;
                }
                else
                {
                    return "NN";
                }
            }
        }
        
        // Days remaining to string, from priority
        private string DaysRemaining(string priority)
        {
            switch (priority)
            {
                case "Baja":
                    return "5 días";
                case "Media":
                    return "4 días";
                case "Alta":
                    return "3 días";
            }
            
            return "NN";
        }

        // DB connection string
        private static string LoadConnectionString(string id = "Default")
        {
            return ConfigurationManager.ConnectionStrings[id].ConnectionString;
        }
    }
}