using System;
using System.Windows.Forms;

namespace AircraftCondition.UIForms
{
    public partial class frmMainUser : Form
    {
        public frmMainUser()
        {
            InitializeComponent();
        }

        private void frmMainUser_Load(object sender, EventArgs e)
        {
        }

        private void metroButton1_Click(object sender, EventArgs e)
        {
            frmAircraft frm = new frmAircraft();
            frm.ShowDialog();
        }

        private void metroButton2_Click(object sender, EventArgs e)
        {
            frmMaintenance frm = new frmMaintenance();
            frm.ShowDialog();
        }

        private void metroButton3_Click(object sender, EventArgs e)
        {
            frmComponent frm = new frmComponent();
            frm.ShowDialog();
        }
    }
}
