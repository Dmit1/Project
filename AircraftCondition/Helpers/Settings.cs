using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AircraftCondition.Helpers
{
    internal class Settings
    {
        public static String Login
        {
            get => Properties.Settings.Default.defLogin;
            private set
            {
                Properties.Settings.Default.defLogin = value;
                Properties.Settings.Default.Save();
            }
        }

        public static String Password
        {
            get => Security.DecryptText(Properties.Settings.Default.defPassword);
            private set
            {
                Properties.Settings.Default.defPassword =
                    String.IsNullOrEmpty(value) ? value : Security.EncryptText(value);
                Properties.Settings.Default.Save();
            }
        }

        public static void SaveDefaultCredentials(string login, string password)
        {
            Login = login;
            Password = password;
        }

        public static void ClearDefaultCredentials()
        {
            SaveDefaultCredentials(null, null);
        }


        public static String DBServer
        {
            get => Properties.Settings.Default.DBServer;
            private set
            {
                Properties.Settings.Default.DBServer = value;
                Properties.Settings.Default.Save();
            }
        }

        public static String DBDatabase
        {
            get => Properties.Settings.Default.DBDatabase;
            private set
            {
                Properties.Settings.Default.DBDatabase = value;
                Properties.Settings.Default.Save();
            }
        }

        public static String DBUserId
        {
            get => Properties.Settings.Default.DBUserId;
            private set
            {
                Properties.Settings.Default.DBUserId = value;
                Properties.Settings.Default.Save();
            }
        }

        public static String DBPassword
        {
            get => String.IsNullOrEmpty(Properties.Settings.Default.DBPassword) ? Properties.Settings.Default.DBPassword : Security.DecryptText(Properties.Settings.Default.DBPassword);
            private set
            {
                Properties.Settings.Default.DBPassword =
                    String.IsNullOrEmpty(value) ? value : Security.EncryptText(value);
                Properties.Settings.Default.Save();
            }


        }

        public static Boolean DBAutoSecurity
        {
            get => Properties.Settings.Default.DBAutoSecurity;
            private set
            {
                Properties.Settings.Default.DBAutoSecurity = value;
                Properties.Settings.Default.Save();
            }
        }

        public static void SaveDBConfigurstion(String server, String database, String login, String pass, Boolean intSecurity)
        {
            DBServer = server;
            DBDatabase = database;
            DBUserId = intSecurity ? null : login;
            DBPassword = intSecurity ? null : pass; ;
            DBAutoSecurity = intSecurity;
        }
    }
}
