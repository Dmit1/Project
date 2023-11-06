using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AircraftCondition.UIForms
{
    public partial class frmPlan : Form
    {
        public frmPlan()
        {
            InitializeComponent();
        }

        private void frmPlan_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "mTADataSet1.vGetAllAircraftInfo". При необходимости она может быть перемещена или удалена.
            this.vGetAllAircraftInfoTableAdapter.Fill(this.mTADataSet1.vGetAllAircraftInfo);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "mTADataSet.vGetAllFlight". При необходимости она может быть перемещена или удалена.
            this.vGetAllFlightTableAdapter.Fill(this.dsFlightInfo.vGetAllFlight);

        }
    }
}
