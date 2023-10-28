using AircraftCondition.Helpers;
using System;
using System.Windows.Forms;

namespace AircraftCondition.UIForms
{
    public partial class frmDBConfig : Form
    {
        public frmDBConfig()
        {
            InitializeComponent();
        }

        private void cbAutoSec_CheckedChanged(object sender, EventArgs e)
        {
            tbUserId.Enabled = !cbAutoSec.Checked;
            tbPassword.Enabled = !cbAutoSec.Checked;
        }

        private void btnTest_Click(object sender, EventArgs e)
        {
            if (ValidateChildren())
            {
                String message = DBMaintenance.TestConnection(tbServer.Text.Trim(),
                    tbDatabase.Text.Trim(),
                    tbUserId.Text.Trim(),
                    tbPassword.Text.Trim(),
                    cbAutoSec.Checked);
                dbSatusLable.Text = message;
            }
            else
            {
                dbSatusLable.Text = "";
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            btnTest_Click(null, null);
            Settings.SaveDBConfigurstion(tbServer.Text,
                tbDatabase.Text, tbUserId.Text, tbPassword.Text,
                cbAutoSec.Checked);
            dbSatusLable.Text = "Test Connection";
        }

        private void frmDBConfig_Load(object sender, EventArgs e)
        {
            tbServer.Text = Settings.DBServer;
            tbDatabase.Text = Settings.DBDatabase;
            if (!String.IsNullOrEmpty(Settings.DBUserId))
            {
                tbUserId.Text = Settings.DBUserId;
                tbPassword.Text = Settings.DBPassword;
            }
            cbAutoSec.Checked = Settings.DBAutoSecurity;
        }

        private void tbIsFild_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            String message = null;
            try
            {
                TextBox tb = sender as TextBox;
                e.Cancel = !Validator.IsFild(tb.Text, tb.Name, out message);

                epError.SetError(tb, message);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void tbIsUsed_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            try
            {
                String message = null;
                TextBox tb = sender as TextBox;
                e.Cancel = !(cbAutoSec.Checked || !Validator.IsFild(tb.Text, tb.Name, out message));

                epError.SetError(tb, message);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void cbAutoSec_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {

        }


        //private static bool IsFild(string value, string controlName, out string message)
    }
}
