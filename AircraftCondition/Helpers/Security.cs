using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.IO;

namespace AircraftCondition.Helpers
{
    internal class Security
    {
        private static readonly string password = "Password";

        public static string EncryptText(string stringToEncrypt, string password)
        {
            string encryptedData = null;
            RijndaelManaged aes = new RijndaelManaged();
            byte[] plaintext = Encoding.Unicode.GetBytes(stringToEncrypt);
            byte[] salt = Encoding.ASCII.GetBytes(password.Length.ToString());
            PasswordDeriveBytes secretKey = new PasswordDeriveBytes(password, salt);
            ICryptoTransform cryptoTransform = 
                aes.CreateEncryptor(secretKey.GetBytes(32), secretKey.GetBytes(16));
            MemoryStream memoryStream = new MemoryStream();
            CryptoStream cryptoStream = 
                new CryptoStream(memoryStream, cryptoTransform, CryptoStreamMode.Write);
            cryptoStream.Write(plaintext, 0, plaintext.Length);
            cryptoStream.FlushFinalBlock();
            byte[] ciphertext = memoryStream.ToArray();
            memoryStream.Close();
            cryptoStream.Close();
            encryptedData = Convert.ToBase64String(ciphertext);

            return encryptedData;
        }

        public static string EncryptText(string stringToEncrypt)
        {
            return EncryptText(stringToEncrypt, password);
        }

        public static string DecryptText(string stringToDecrypt, string password)
        {
            string decryptedData = null;
            RijndaelManaged aes = new RijndaelManaged();
            byte[] encryptedData = Convert.FromBase64String(stringToDecrypt);
            byte[] salt = Encoding.ASCII.GetBytes(password.Length.ToString());
            PasswordDeriveBytes secretKey = new PasswordDeriveBytes(password, salt);
            ICryptoTransform cryptoTransform =
                aes.CreateDecryptor(secretKey.GetBytes(32), secretKey.GetBytes(16));
            MemoryStream memoryStream = new MemoryStream(encryptedData);
            CryptoStream cryptoStream =
                new CryptoStream(memoryStream, cryptoTransform, CryptoStreamMode.Read);
            byte[] plainText = new byte[encryptedData.Length];
            int decryptedCount = cryptoStream.Read(plainText, 0, plainText.Length);
            memoryStream.Close();
            cryptoStream.Close();
            decryptedData = Encoding.Unicode.GetString(plainText, 0, decryptedCount);

            return decryptedData;
        }

        public static string DecryptText(string stringToDecrypt)
        {
            return DecryptText(stringToDecrypt, password);
        }
    }
}
