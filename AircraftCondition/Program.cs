using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using AircraftCondition.Helpers;
using AircraftCondition.UIForms;

namespace AircraftCondition
{
    internal static class Program
    {
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new frmLogin());
            if (UserCredentials.IsLoggedIn)
            {
                if (UserCredentials.Roles.Contains("Admin"))
                    Application.Run(new frmMainAdmin());
                else if (UserCredentials.Roles.Contains("User"))
                    Application.Run(new frmMainUser());
                else if(UserCredentials.Roles.Contains("Plan"))
                      Application.Run(new frmPlan()); 
            }
        }
    }
}
