namespace AircraftCondition.UIForms
{
    partial class frmLogin
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmLogin));
            this.btnOk = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.lLogin = new System.Windows.Forms.Label();
            this.tbLogin = new System.Windows.Forms.TextBox();
            this.tbPassword = new System.Windows.Forms.TextBox();
            this.lPassword = new System.Windows.Forms.Label();
            this.cbShowPassword = new System.Windows.Forms.CheckBox();
            this.cbSaveData = new System.Windows.Forms.CheckBox();
            this.linkRegistration = new System.Windows.Forms.LinkLabel();
            this.linkDBConfiguration = new System.Windows.Forms.LinkLabel();
            this.Hint = new System.Windows.Forms.ToolTip(this.components);
            this.epLogin = new System.Windows.Forms.ErrorProvider(this.components);
            this.epPassword = new System.Windows.Forms.ErrorProvider(this.components);
            this.errorProvider = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.epLogin)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.epPassword)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider)).BeginInit();
            this.SuspendLayout();
            // 
            // btnOk
            // 
            this.btnOk.Location = new System.Drawing.Point(33, 123);
            this.btnOk.Name = "btnOk";
            this.btnOk.Size = new System.Drawing.Size(75, 23);
            this.btnOk.TabIndex = 4;
            this.btnOk.Text = "OK";
            this.btnOk.UseVisualStyleBackColor = true;
            this.btnOk.Click += new System.EventHandler(this.btnOk_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCancel.Location = new System.Drawing.Point(211, 123);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 5;
            this.btnCancel.Text = "CANCEL";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // lLogin
            // 
            this.lLogin.AutoSize = true;
            this.lLogin.Location = new System.Drawing.Point(30, 19);
            this.lLogin.Name = "lLogin";
            this.lLogin.Size = new System.Drawing.Size(36, 13);
            this.lLogin.TabIndex = 100;
            this.lLogin.Text = "Login:";
            // 
            // tbLogin
            // 
            this.tbLogin.Location = new System.Drawing.Point(33, 35);
            this.tbLogin.Name = "tbLogin";
            this.tbLogin.Size = new System.Drawing.Size(253, 20);
            this.tbLogin.TabIndex = 0;
            // 
            // tbPassword
            // 
            this.tbPassword.Location = new System.Drawing.Point(33, 74);
            this.tbPassword.Name = "tbPassword";
            this.tbPassword.PasswordChar = '*';
            this.tbPassword.Size = new System.Drawing.Size(253, 20);
            this.tbPassword.TabIndex = 1;
            // 
            // lPassword
            // 
            this.lPassword.AutoSize = true;
            this.lPassword.Location = new System.Drawing.Point(30, 58);
            this.lPassword.Name = "lPassword";
            this.lPassword.Size = new System.Drawing.Size(56, 13);
            this.lPassword.TabIndex = 200;
            this.lPassword.Text = "Password:";
            // 
            // cbShowPassword
            // 
            this.cbShowPassword.AutoSize = true;
            this.cbShowPassword.Location = new System.Drawing.Point(266, 77);
            this.cbShowPassword.Name = "cbShowPassword";
            this.cbShowPassword.Size = new System.Drawing.Size(15, 14);
            this.cbShowPassword.TabIndex = 2;
            this.cbShowPassword.UseVisualStyleBackColor = true;
            this.cbShowPassword.CheckedChanged += new System.EventHandler(this.cbShowPassword_CheckedChanged);
            this.cbShowPassword.MouseLeave += new System.EventHandler(this.cbShowPassword_MouseLeave);
            // 
            // cbSaveData
            // 
            this.cbSaveData.AutoSize = true;
            this.cbSaveData.Location = new System.Drawing.Point(33, 100);
            this.cbSaveData.Name = "cbSaveData";
            this.cbSaveData.Size = new System.Drawing.Size(89, 17);
            this.cbSaveData.TabIndex = 3;
            this.cbSaveData.Text = "remember me";
            this.cbSaveData.UseVisualStyleBackColor = true;
            // 
            // linkRegistration
            // 
            this.linkRegistration.AutoSize = true;
            this.linkRegistration.Location = new System.Drawing.Point(128, 159);
            this.linkRegistration.Name = "linkRegistration";
            this.linkRegistration.Size = new System.Drawing.Size(63, 13);
            this.linkRegistration.TabIndex = 8;
            this.linkRegistration.TabStop = true;
            this.linkRegistration.Text = "Registration";
            this.linkRegistration.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkRegistration_LinkClicked);
            // 
            // linkDBConfiguration
            // 
            this.linkDBConfiguration.AutoSize = true;
            this.linkDBConfiguration.Location = new System.Drawing.Point(80, 181);
            this.linkDBConfiguration.Name = "linkDBConfiguration";
            this.linkDBConfiguration.Size = new System.Drawing.Size(159, 13);
            this.linkDBConfiguration.TabIndex = 9;
            this.linkDBConfiguration.TabStop = true;
            this.linkDBConfiguration.Text = "Change DataBase Configuration";
            this.linkDBConfiguration.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkDBConfiguration_LinkClicked);
            // 
            // epLogin
            // 
            this.epLogin.ContainerControl = this;
            // 
            // epPassword
            // 
            this.epPassword.ContainerControl = this;
            // 
            // errorProvider
            // 
            this.errorProvider.ContainerControl = this;
            // 
            // frmLogin
            // 
            this.AcceptButton = this.btnOk;
            this.AccessibleDescription = "Login form";
            this.AutoScaleDimensions = new System.Drawing.SizeF(96F, 96F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoSize = true;
            this.CancelButton = this.btnCancel;
            this.ClientSize = new System.Drawing.Size(330, 202);
            this.Controls.Add(this.linkDBConfiguration);
            this.Controls.Add(this.linkRegistration);
            this.Controls.Add(this.cbSaveData);
            this.Controls.Add(this.cbShowPassword);
            this.Controls.Add(this.tbPassword);
            this.Controls.Add(this.lPassword);
            this.Controls.Add(this.tbLogin);
            this.Controls.Add(this.lLogin);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnOk);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmLogin";
            this.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Tag = "Login form";
            this.Text = "User Login";
            this.Hint.SetToolTip(this, "Login form for user");
            this.Load += new System.EventHandler(this.frmLogin_Load);
            ((System.ComponentModel.ISupportInitialize)(this.epLogin)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.epPassword)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnOk;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Label lLogin;
        private System.Windows.Forms.TextBox tbLogin;
        private System.Windows.Forms.TextBox tbPassword;
        private System.Windows.Forms.Label lPassword;
        private System.Windows.Forms.CheckBox cbShowPassword;
        private System.Windows.Forms.CheckBox cbSaveData;
        private System.Windows.Forms.LinkLabel linkRegistration;
        private System.Windows.Forms.LinkLabel linkDBConfiguration;
        private System.Windows.Forms.ToolTip Hint;
        private System.Windows.Forms.ErrorProvider epLogin;
        private System.Windows.Forms.ErrorProvider epPassword;
        private System.Windows.Forms.ErrorProvider errorProvider;
    }
}

