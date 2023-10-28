using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AircraftCondition.Helpers
{
    internal class UserCredentials
    {
        public static List<string> roles = new List<string>();

        
        public static string FirstName { get; set; }
        public static string LastName { get; set; }

        public static Boolean IsLoggedIn { get; set; }

        public static List<string> Roles
        {
            get => roles;
            set => roles = value;
        }

        public static void AddNewRole(string role)
        {
            if(String.IsNullOrEmpty(role) || String.IsNullOrWhiteSpace(role))
                throw new ArgumentNullException(nameof(role));
            if (roles.Contains(role))
                throw new Exception("This role already exists");
            roles.Add(role);
        }
        


    }
}
