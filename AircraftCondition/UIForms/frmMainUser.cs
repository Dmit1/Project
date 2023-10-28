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
    }
}
