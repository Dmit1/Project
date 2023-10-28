using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using AircraftCondition.Helpers;

namespace AircraftCondition.UIForms
{
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }
        private void button1_Click(object sender, EventArgs e)
        {

        }
        private void button1_MouseEnter(object sender, EventArgs e)
        {

        }
        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void btnOk_Click(object sender, EventArgs e)
        {
            if (isCredentialValid)
            {
                try
                {
                    if (cbSaveData.Checked)
                        Settings.SaveDefaultCredentials(tbLogin.Text,
                            tbPassword.Text);
                    else
                        Settings.ClearDefaultCredentials();
                    //MessageBox.Show( Security.EncryptText(tbLogin.Text) );

                    // UserCredentials userCredentials = new UserCredentials();

                    String firstName = null;
                    String lastName = null;
                    List<String> roles = new List<string>();

                    UserCredentials.IsLoggedIn = DBMaintenance.TryGetUserCredential(tbLogin.Text.Trim(),
                    tbPassword.Text.Trim(), out firstName, out lastName, out roles);

                    UserCredentials.FirstName = firstName;
                    UserCredentials.LastName = lastName;
                    UserCredentials.Roles = roles;

                    this.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }
        private Boolean isCredentialValid
        {
            get
            {
                string loginError = null;
                string passwordError = null;

                if (Validator.ValidLogin(tbLogin, out loginError) &
                    Validator.ValidPassword(tbPassword, out passwordError))
                {
                    errorProvider.SetError(tbLogin, null);
                    errorProvider.SetError(tbPassword, null);
                    return true;
                }

                errorProvider.SetError(tbLogin, loginError);
                errorProvider.SetError(tbPassword, passwordError);

                return false;
            }
        }
        private void cbShowPassword_CheckedChanged(object sender, EventArgs e)
        {
            tbPassword.PasswordChar = cbShowPassword.Checked ? '\0' : '*';
        }
        private void cbShowPassword_MouseLeave(object sender, EventArgs e)
        {
            cbShowPassword.Checked = false;
        }
        private void frmLogin_Load(object sender, EventArgs e)
        {
            if(!String.IsNullOrEmpty(Settings.Login))
            {
                tbLogin.Text = Settings.Login;
                tbPassword.Text = Settings.Password;
                cbSaveData.Checked = true;
            }
        }
        private void linkRegistration_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            frmRegistration frm = new frmRegistration();
            frm.ShowDialog();
        }
        private void linkDBConfiguration_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            frmDBConfig frm = new frmDBConfig();
            frm.ShowDialog();
        }
    }
}
