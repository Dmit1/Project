using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AircraftCondition.Helpers
{
    internal class DBMaintenance
    {
        private static SqlConnection connection = null;
        private static SqlCommand command = null;
        private static SqlDataReader reader = null;
        //private static SqlDataAdapter dataAdapter = null;
        //private static SqlCommandBuilder sqlBuilder = null;

        private static readonly string spGetUserCredential = "spGetUserCredential";
        public static string ConnectionString()
        {
            return ConnectionString(Settings.DBServer.Trim(), Settings.DBDatabase.Trim(),
                Settings.DBUserId.Trim(), Settings.DBPassword.Trim(), Settings.DBAutoSecurity);
        }
        public static string ConnectionString(String server, String database, String userId, string password, bool autoSacurity)
        {
            //Data Source=DESKTOP-7IHQ5JA\\SQLEXPRESS;Initial Catalog=PZ2_21PO;Integrated Security=True
            string temp = $"Server={server};Database={database};";
            if (autoSacurity)
                return $@"{temp}Trusted_Connection=True";
            return $@"{temp}User Id={userId};Password={password};";

        }
        public static string TestConnection()
        {
            try
            {
                using (connection = new SqlConnection(ConnectionString()))
                    connection.Open();
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "Test connection secceeded";
        }
        public static string TestConnection(String server, String database, String userId, string password, bool autoSacurity)
        {
            try
            {

                using (connection = new SqlConnection(ConnectionString(server, database, userId, password, autoSacurity)))
                    connection.Open();
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return "Test connection secceeded";
        }
        public static bool TryGetUserCredential(string login, string password,
            out String firstName, out String secondName, out List<String> roles)
        {
            roles = new List<string>();

            using (connection = new SqlConnection(ConnectionString()))
            {
                connection.Open();

                command = new SqlCommand(spGetUserCredential, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.AddRange(
                    new SqlParameter[]
                    {
                        new SqlParameter("@login", login.Trim()),
                        new SqlParameter("@password", password.Trim()),
                        new SqlParameter("@firstName", ParameterDirection.Output),
                        new SqlParameter("@secondName", ParameterDirection.Output)
                    });

                reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    firstName = command.Parameters["@firstName"].Value.ToString().Trim();
                    secondName = command.Parameters["@secondName"].Value.ToString().Trim();
                    while (reader.Read())
                        roles.Add(reader.GetValue(0).ToString().Trim());
                }
                else
                {
                    throw new Exception("Account not found");
                }
            }
            return true;
        }
    }
}
