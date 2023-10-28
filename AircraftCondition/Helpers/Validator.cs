using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AircraftCondition.Helpers
{
    internal class Validator
    {
        //https://regex101.com/r/jrBhVS/6

        public static readonly string dateFormat = "dd.MM.yyyy";
        public static readonly CultureInfo culture = CultureInfo.InvariantCulture;

        private static readonly Regex rgxLogin = new Regex(@"^(?=.*[A-Za-z0-9]$)[A-Za-z][A-Za-z\d.-_]{0,19}$");
        private static readonly Regex rgxPassword = new Regex(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d@#$!*&_]{8,20}$");
        public static bool ValidLogin(String text, out string message)
        {
            message = null;

            if (isFildAndValid(text, "Login", rgxLogin, out message))
                return true;

            message += $"\nRequired minimum one character, \nmust start with a letter";

            return false;
        }

        public static bool ValidLogin(Control control, out string message)
        {
            return ValidLogin(control.Text, out message);
        }
        public static bool ValidPassword(String text, out string message)
        {
            message = null;

            if (isFildAndValid(text, "Password", rgxPassword, out message))
                return true;

            message += $"\nRequired minimum eight characters, \nat least one uppercase letter, \none lowercase letter and one number";

            return false;
        }
        public static bool ValidPassword(Control control, out string message)
        {
            return ValidPassword(control.Text, out message);
        }
        public static bool IsFild(string value, string controlName, out string message)
        {
            bool valid = !(String.IsNullOrEmpty(value) || 
                String.IsNullOrWhiteSpace(value));

            if (valid) message = null;
            else message = $"{controlName} required!";

            return valid;
        }
        private static bool isValid(string value, string controlName, Regex regex, out string message)
        {
            bool valid = regex.IsMatch(value);

            if (valid) message = null;
            else message = $"{controlName} is not valid!";

            return valid;

        }
        private static bool isFildAndValid(string value, string controlName, Regex regex, out string message)
        {
            message = null;

            if (!IsFild(value, controlName, out message))
                return false;

            if (!isValid(value, controlName, regex, out message))
                return false;

            return true;
        }
        public static String BirthdayValidationMessage(String value)
        {
            DateTime birthday;

            if (!DateTime.TryParseExact(value, dateFormat, culture, DateTimeStyles.None, out birthday))
                return null;

            if (birthday > DateTime.Now || DateTime.Now.Year - birthday.Year > 150)
                return "Birthday is invalid";

            return null;
        }
    }
}
