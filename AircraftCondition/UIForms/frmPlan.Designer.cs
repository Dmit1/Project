namespace AircraftCondition.UIForms
{
    partial class frmPlan
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.dateTimePicker2 = new System.Windows.Forms.DateTimePicker();
            this.label3 = new System.Windows.Forms.Label();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.button5 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.dsFlightInfo = new AircraftCondition.MTADataSet();
            this.vGetAllFlightBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.vGetAllFlightTableAdapter = new AircraftCondition.MTADataSetTableAdapters.vGetAllFlightTableAdapter();
            this.nameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.regNumberDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dateDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.flightTypeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.airportDepartureDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.timeDepartureDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.airportArrivalDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.timeArrivalDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.airHoursDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groundHoursDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.flightCompletedDataGridViewCheckBoxColumn = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.mTADataSet1 = new AircraftCondition.MTADataSet1();
            this.vGetAllAircraftInfoBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.vGetAllAircraftInfoTableAdapter = new AircraftCondition.MTADataSet1TableAdapters.vGetAllAircraftInfoTableAdapter();
            this.regNumberDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nameDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.manufactureDateDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.manufactureNameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.manufactureNumberDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsFlightInfo)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.vGetAllFlightBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mTADataSet1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.vGetAllAircraftInfoBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.dataGridView1);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1380, 248);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Информация о полетах";
            // 
            // button1
            // 
            this.button1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.button1.Location = new System.Drawing.Point(1291, 266);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(89, 28);
            this.button1.TabIndex = 1;
            this.button1.Text = "Сохранить";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // button3
            // 
            this.button3.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.button3.Location = new System.Drawing.Point(1196, 266);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(89, 28);
            this.button3.TabIndex = 3;
            this.button3.Text = "Удалить";
            this.button3.UseVisualStyleBackColor = true;
            // 
            // button4
            // 
            this.button4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.button4.Location = new System.Drawing.Point(1106, 266);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(84, 28);
            this.button4.TabIndex = 4;
            this.button4.Text = "Добавить";
            this.button4.UseVisualStyleBackColor = true;
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.groupBox2.Controls.Add(this.dateTimePicker2);
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.dateTimePicker1);
            this.groupBox2.Controls.Add(this.label2);
            this.groupBox2.Controls.Add(this.textBox1);
            this.groupBox2.Controls.Add(this.label1);
            this.groupBox2.Controls.Add(this.button5);
            this.groupBox2.Controls.Add(this.button2);
            this.groupBox2.Location = new System.Drawing.Point(16, 344);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(310, 194);
            this.groupBox2.TabIndex = 5;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Справка о выполненных полетах";
            // 
            // dateTimePicker2
            // 
            this.dateTimePicker2.Location = new System.Drawing.Point(96, 89);
            this.dateTimePicker2.Name = "dateTimePicker2";
            this.dateTimePicker2.Size = new System.Drawing.Size(175, 22);
            this.dateTimePicker2.TabIndex = 7;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 92);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(73, 16);
            this.label3.TabIndex = 6;
            this.label3.Text = "Период с :";
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Location = new System.Drawing.Point(96, 56);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(175, 22);
            this.dateTimePicker1.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(6, 62);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(73, 16);
            this.label2.TabIndex = 4;
            this.label2.Text = "Период с :";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(96, 25);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(175, 22);
            this.textBox1.TabIndex = 3;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(73, 16);
            this.label1.TabIndex = 2;
            this.label1.Text = "Выбор ВС:";
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(176, 154);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(95, 23);
            this.button5.TabIndex = 1;
            this.button5.Text = "Печать";
            this.button5.UseVisualStyleBackColor = true;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(9, 154);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(95, 23);
            this.button2.TabIndex = 0;
            this.button2.Text = "Просмотр";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // groupBox3
            // 
            this.groupBox3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox3.Controls.Add(this.dataGridView2);
            this.groupBox3.Location = new System.Drawing.Point(358, 344);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(1031, 194);
            this.groupBox3.TabIndex = 6;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Исправные ВС";
            // 
            // dataGridView1
            // 
            this.dataGridView1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.nameDataGridViewTextBoxColumn,
            this.regNumberDataGridViewTextBoxColumn,
            this.dateDataGridViewTextBoxColumn,
            this.flightTypeDataGridViewTextBoxColumn,
            this.airportDepartureDataGridViewTextBoxColumn,
            this.timeDepartureDataGridViewTextBoxColumn,
            this.airportArrivalDataGridViewTextBoxColumn,
            this.timeArrivalDataGridViewTextBoxColumn,
            this.airHoursDataGridViewTextBoxColumn,
            this.groundHoursDataGridViewTextBoxColumn,
            this.flightCompletedDataGridViewCheckBoxColumn});
            this.dataGridView1.DataSource = this.vGetAllFlightBindingSource;
            this.dataGridView1.Location = new System.Drawing.Point(6, 30);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(1361, 249);
            this.dataGridView1.TabIndex = 0;
            // 
            // dsFlightInfo
            // 
            this.dsFlightInfo.DataSetName = "MTADataSet";
            this.dsFlightInfo.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // vGetAllFlightBindingSource
            // 
            this.vGetAllFlightBindingSource.DataMember = "vGetAllFlight";
            this.vGetAllFlightBindingSource.DataSource = this.dsFlightInfo;
            // 
            // vGetAllFlightTableAdapter
            // 
            this.vGetAllFlightTableAdapter.ClearBeforeFill = true;
            // 
            // nameDataGridViewTextBoxColumn
            // 
            this.nameDataGridViewTextBoxColumn.DataPropertyName = "Name";
            this.nameDataGridViewTextBoxColumn.HeaderText = "Name";
            this.nameDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.nameDataGridViewTextBoxColumn.Name = "nameDataGridViewTextBoxColumn";
            this.nameDataGridViewTextBoxColumn.Width = 125;
            // 
            // regNumberDataGridViewTextBoxColumn
            // 
            this.regNumberDataGridViewTextBoxColumn.DataPropertyName = "RegNumber";
            this.regNumberDataGridViewTextBoxColumn.HeaderText = "RegNumber";
            this.regNumberDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.regNumberDataGridViewTextBoxColumn.Name = "regNumberDataGridViewTextBoxColumn";
            this.regNumberDataGridViewTextBoxColumn.Width = 125;
            // 
            // dateDataGridViewTextBoxColumn
            // 
            this.dateDataGridViewTextBoxColumn.DataPropertyName = "Date";
            this.dateDataGridViewTextBoxColumn.HeaderText = "Date";
            this.dateDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.dateDataGridViewTextBoxColumn.Name = "dateDataGridViewTextBoxColumn";
            this.dateDataGridViewTextBoxColumn.Width = 125;
            // 
            // flightTypeDataGridViewTextBoxColumn
            // 
            this.flightTypeDataGridViewTextBoxColumn.DataPropertyName = "FlightType";
            this.flightTypeDataGridViewTextBoxColumn.HeaderText = "FlightType";
            this.flightTypeDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.flightTypeDataGridViewTextBoxColumn.Name = "flightTypeDataGridViewTextBoxColumn";
            this.flightTypeDataGridViewTextBoxColumn.Width = 125;
            // 
            // airportDepartureDataGridViewTextBoxColumn
            // 
            this.airportDepartureDataGridViewTextBoxColumn.DataPropertyName = "AirportDeparture";
            this.airportDepartureDataGridViewTextBoxColumn.HeaderText = "AirportDeparture";
            this.airportDepartureDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.airportDepartureDataGridViewTextBoxColumn.Name = "airportDepartureDataGridViewTextBoxColumn";
            this.airportDepartureDataGridViewTextBoxColumn.Width = 125;
            // 
            // timeDepartureDataGridViewTextBoxColumn
            // 
            this.timeDepartureDataGridViewTextBoxColumn.DataPropertyName = "TimeDeparture";
            this.timeDepartureDataGridViewTextBoxColumn.HeaderText = "TimeDeparture";
            this.timeDepartureDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.timeDepartureDataGridViewTextBoxColumn.Name = "timeDepartureDataGridViewTextBoxColumn";
            this.timeDepartureDataGridViewTextBoxColumn.Width = 125;
            // 
            // airportArrivalDataGridViewTextBoxColumn
            // 
            this.airportArrivalDataGridViewTextBoxColumn.DataPropertyName = "AirportArrival";
            this.airportArrivalDataGridViewTextBoxColumn.HeaderText = "AirportArrival";
            this.airportArrivalDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.airportArrivalDataGridViewTextBoxColumn.Name = "airportArrivalDataGridViewTextBoxColumn";
            this.airportArrivalDataGridViewTextBoxColumn.Width = 125;
            // 
            // timeArrivalDataGridViewTextBoxColumn
            // 
            this.timeArrivalDataGridViewTextBoxColumn.DataPropertyName = "TimeArrival";
            this.timeArrivalDataGridViewTextBoxColumn.HeaderText = "TimeArrival";
            this.timeArrivalDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.timeArrivalDataGridViewTextBoxColumn.Name = "timeArrivalDataGridViewTextBoxColumn";
            this.timeArrivalDataGridViewTextBoxColumn.Width = 125;
            // 
            // airHoursDataGridViewTextBoxColumn
            // 
            this.airHoursDataGridViewTextBoxColumn.DataPropertyName = "AirHours";
            this.airHoursDataGridViewTextBoxColumn.HeaderText = "AirHours";
            this.airHoursDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.airHoursDataGridViewTextBoxColumn.Name = "airHoursDataGridViewTextBoxColumn";
            this.airHoursDataGridViewTextBoxColumn.Width = 125;
            // 
            // groundHoursDataGridViewTextBoxColumn
            // 
            this.groundHoursDataGridViewTextBoxColumn.DataPropertyName = "GroundHours";
            this.groundHoursDataGridViewTextBoxColumn.HeaderText = "GroundHours";
            this.groundHoursDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.groundHoursDataGridViewTextBoxColumn.Name = "groundHoursDataGridViewTextBoxColumn";
            this.groundHoursDataGridViewTextBoxColumn.Width = 125;
            // 
            // flightCompletedDataGridViewCheckBoxColumn
            // 
            this.flightCompletedDataGridViewCheckBoxColumn.DataPropertyName = "FlightCompleted";
            this.flightCompletedDataGridViewCheckBoxColumn.HeaderText = "FlightCompleted";
            this.flightCompletedDataGridViewCheckBoxColumn.MinimumWidth = 6;
            this.flightCompletedDataGridViewCheckBoxColumn.Name = "flightCompletedDataGridViewCheckBoxColumn";
            this.flightCompletedDataGridViewCheckBoxColumn.Width = 125;
            // 
            // dataGridView2
            // 
            this.dataGridView2.AutoGenerateColumns = false;
            this.dataGridView2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView2.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.regNumberDataGridViewTextBoxColumn1,
            this.nameDataGridViewTextBoxColumn1,
            this.manufactureDateDataGridViewTextBoxColumn,
            this.manufactureNameDataGridViewTextBoxColumn,
            this.manufactureNumberDataGridViewTextBoxColumn});
            this.dataGridView2.DataSource = this.vGetAllAircraftInfoBindingSource;
            this.dataGridView2.Location = new System.Drawing.Point(22, 25);
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.RowHeadersWidth = 51;
            this.dataGridView2.RowTemplate.Height = 24;
            this.dataGridView2.Size = new System.Drawing.Size(990, 152);
            this.dataGridView2.TabIndex = 0;
            // 
            // mTADataSet1
            // 
            this.mTADataSet1.DataSetName = "MTADataSet1";
            this.mTADataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // vGetAllAircraftInfoBindingSource
            // 
            this.vGetAllAircraftInfoBindingSource.DataMember = "vGetAllAircraftInfo";
            this.vGetAllAircraftInfoBindingSource.DataSource = this.mTADataSet1;
            // 
            // vGetAllAircraftInfoTableAdapter
            // 
            this.vGetAllAircraftInfoTableAdapter.ClearBeforeFill = true;
            // 
            // regNumberDataGridViewTextBoxColumn1
            // 
            this.regNumberDataGridViewTextBoxColumn1.DataPropertyName = "RegNumber";
            this.regNumberDataGridViewTextBoxColumn1.HeaderText = "RegNumber";
            this.regNumberDataGridViewTextBoxColumn1.MinimumWidth = 6;
            this.regNumberDataGridViewTextBoxColumn1.Name = "regNumberDataGridViewTextBoxColumn1";
            this.regNumberDataGridViewTextBoxColumn1.Width = 125;
            // 
            // nameDataGridViewTextBoxColumn1
            // 
            this.nameDataGridViewTextBoxColumn1.DataPropertyName = "Name";
            this.nameDataGridViewTextBoxColumn1.HeaderText = "Name";
            this.nameDataGridViewTextBoxColumn1.MinimumWidth = 6;
            this.nameDataGridViewTextBoxColumn1.Name = "nameDataGridViewTextBoxColumn1";
            this.nameDataGridViewTextBoxColumn1.Width = 125;
            // 
            // manufactureDateDataGridViewTextBoxColumn
            // 
            this.manufactureDateDataGridViewTextBoxColumn.DataPropertyName = "ManufactureDate";
            this.manufactureDateDataGridViewTextBoxColumn.HeaderText = "ManufactureDate";
            this.manufactureDateDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.manufactureDateDataGridViewTextBoxColumn.Name = "manufactureDateDataGridViewTextBoxColumn";
            this.manufactureDateDataGridViewTextBoxColumn.Width = 125;
            // 
            // manufactureNameDataGridViewTextBoxColumn
            // 
            this.manufactureNameDataGridViewTextBoxColumn.DataPropertyName = "ManufactureName";
            this.manufactureNameDataGridViewTextBoxColumn.HeaderText = "ManufactureName";
            this.manufactureNameDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.manufactureNameDataGridViewTextBoxColumn.Name = "manufactureNameDataGridViewTextBoxColumn";
            this.manufactureNameDataGridViewTextBoxColumn.Width = 125;
            // 
            // manufactureNumberDataGridViewTextBoxColumn
            // 
            this.manufactureNumberDataGridViewTextBoxColumn.DataPropertyName = "ManufactureNumber";
            this.manufactureNumberDataGridViewTextBoxColumn.HeaderText = "ManufactureNumber";
            this.manufactureNumberDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.manufactureNumberDataGridViewTextBoxColumn.Name = "manufactureNumberDataGridViewTextBoxColumn";
            this.manufactureNumberDataGridViewTextBoxColumn.Width = 125;
            // 
            // frmPlan
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1404, 566);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.button1);
            this.Name = "frmPlan";
            this.Text = "ПДО ";
            this.Load += new System.EventHandler(this.frmPlan_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dsFlightInfo)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.vGetAllFlightBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.mTADataSet1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.vGetAllAircraftInfoBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.DateTimePicker dateTimePicker2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.DataGridView dataGridView1;
        private MTADataSet dsFlightInfo;
        private System.Windows.Forms.BindingSource vGetAllFlightBindingSource;
        private MTADataSetTableAdapters.vGetAllFlightTableAdapter vGetAllFlightTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn regNumberDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn dateDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn flightTypeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn airportDepartureDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn timeDepartureDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn airportArrivalDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn timeArrivalDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn airHoursDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn groundHoursDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewCheckBoxColumn flightCompletedDataGridViewCheckBoxColumn;
        private System.Windows.Forms.DataGridView dataGridView2;
        private MTADataSet1 mTADataSet1;
        private System.Windows.Forms.BindingSource vGetAllAircraftInfoBindingSource;
        private MTADataSet1TableAdapters.vGetAllAircraftInfoTableAdapter vGetAllAircraftInfoTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn regNumberDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn manufactureDateDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn manufactureNameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn manufactureNumberDataGridViewTextBoxColumn;
    }
}