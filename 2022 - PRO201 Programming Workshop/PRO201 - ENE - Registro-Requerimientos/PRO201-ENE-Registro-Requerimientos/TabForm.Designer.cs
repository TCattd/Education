namespace PRO201_ENE_Registro_Requerimientos
{
    partial class TabForm
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.button5 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.id = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.type = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.priority = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.description = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.assigned = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.status = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.days = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.button1 = new System.Windows.Forms.Button();
            this.checkBox2 = new System.Windows.Forms.CheckBox();
            this.checkBox1 = new System.Windows.Forms.CheckBox();
            this.comboBox2 = new System.Windows.Forms.ComboBox();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.button7 = new System.Windows.Forms.Button();
            this.button6 = new System.Windows.Forms.Button();
            this.comboBox5 = new System.Windows.Forms.ComboBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.comboBox4 = new System.Windows.Forms.ComboBox();
            this.comboBox3 = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.tabPage2.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Location = new System.Drawing.Point(12, 12);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(785, 468);
            this.tabControl1.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.label9);
            this.tabPage1.Controls.Add(this.button5);
            this.tabPage1.Controls.Add(this.button4);
            this.tabPage1.Controls.Add(this.button3);
            this.tabPage1.Controls.Add(this.button2);
            this.tabPage1.Controls.Add(this.dataGridView1);
            this.tabPage1.Controls.Add(this.button1);
            this.tabPage1.Controls.Add(this.checkBox2);
            this.tabPage1.Controls.Add(this.checkBox1);
            this.tabPage1.Controls.Add(this.comboBox2);
            this.tabPage1.Controls.Add(this.comboBox1);
            this.tabPage1.Controls.Add(this.label3);
            this.tabPage1.Controls.Add(this.label2);
            this.tabPage1.Controls.Add(this.label1);
            this.tabPage1.Location = new System.Drawing.Point(4, 24);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(777, 440);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Listado Requerimientos";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // button5
            // 
            this.button5.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.button5.Location = new System.Drawing.Point(346, 133);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(191, 23);
            this.button5.TabIndex = 12;
            this.button5.Text = "Limpiar";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.ClearButtonClick);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(169, 395);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(139, 23);
            this.button4.TabIndex = 11;
            this.button4.Text = "Marcar Pendiente";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.MarkAsPendingClick);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(323, 395);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(139, 23);
            this.button3.TabIndex = 10;
            this.button3.Text = "Eliminar";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.DeleteRowClick);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(18, 395);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(139, 23);
            this.button2.TabIndex = 9;
            this.button2.Text = "Marcar Resuelto";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.MarkAsResolvedClick);
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.id,
            this.type,
            this.priority,
            this.description,
            this.assigned,
            this.status,
            this.days});
            this.dataGridView1.Location = new System.Drawing.Point(17, 173);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowTemplate.Height = 25;
            this.dataGridView1.Size = new System.Drawing.Size(738, 203);
            this.dataGridView1.TabIndex = 8;
            // 
            // id
            // 
            this.id.HeaderText = "id";
            this.id.Name = "id";
            this.id.ReadOnly = true;
            // 
            // type
            // 
            this.type.HeaderText = "Área";
            this.type.Name = "type";
            this.type.ReadOnly = true;
            // 
            // priority
            // 
            this.priority.HeaderText = "Prioridad";
            this.priority.Name = "priority";
            this.priority.ReadOnly = true;
            // 
            // description
            // 
            this.description.HeaderText = "Descripción";
            this.description.Name = "description";
            this.description.ReadOnly = true;
            // 
            // assigned
            // 
            this.assigned.HeaderText = "Encargado";
            this.assigned.Name = "assigned";
            this.assigned.ReadOnly = true;
            // 
            // status
            // 
            this.status.HeaderText = "Estado";
            this.status.Name = "status";
            this.status.ReadOnly = true;
            // 
            // days
            // 
            this.days.HeaderText = "Días plazo";
            this.days.Name = "days";
            this.days.ReadOnly = true;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.button1.Location = new System.Drawing.Point(564, 134);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(191, 23);
            this.button1.TabIndex = 7;
            this.button1.Text = "Buscar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.SearchButtonClick);
            // 
            // checkBox2
            // 
            this.checkBox2.AutoSize = true;
            this.checkBox2.Location = new System.Drawing.Point(165, 137);
            this.checkBox2.Name = "checkBox2";
            this.checkBox2.Size = new System.Drawing.Size(76, 19);
            this.checkBox2.TabIndex = 6;
            this.checkBox2.Text = "Resueltos";
            this.checkBox2.UseVisualStyleBackColor = true;
            // 
            // checkBox1
            // 
            this.checkBox1.AutoSize = true;
            this.checkBox1.Checked = true;
            this.checkBox1.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox1.Location = new System.Drawing.Point(17, 137);
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(84, 19);
            this.checkBox1.TabIndex = 5;
            this.checkBox1.Text = "Pendientes";
            this.checkBox1.UseVisualStyleBackColor = true;
            // 
            // comboBox2
            // 
            this.comboBox2.FormattingEnabled = true;
            this.comboBox2.Items.AddRange(new object[] {
            "Baja",
            "Media",
            "Alta"});
            this.comboBox2.Location = new System.Drawing.Point(80, 86);
            this.comboBox2.Name = "comboBox2";
            this.comboBox2.Size = new System.Drawing.Size(182, 23);
            this.comboBox2.TabIndex = 4;
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Items.AddRange(new object[] {
            "Base de Datos",
            "Sistemas",
            "Servidores"});
            this.comboBox1.Location = new System.Drawing.Point(80, 46);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(182, 23);
            this.comboBox1.TabIndex = 3;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 94);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(58, 15);
            this.label3.TabIndex = 2;
            this.label3.Text = "Prioridad:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(13, 54);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(33, 15);
            this.label2.TabIndex = 1;
            this.label2.Text = "Tipo:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(11, 11);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(213, 21);
            this.label1.TabIndex = 0;
            this.label1.Text = "Listado de Requerimientos";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.button7);
            this.tabPage2.Controls.Add(this.button6);
            this.tabPage2.Controls.Add(this.comboBox5);
            this.tabPage2.Controls.Add(this.label8);
            this.tabPage2.Controls.Add(this.label7);
            this.tabPage2.Controls.Add(this.richTextBox1);
            this.tabPage2.Controls.Add(this.comboBox4);
            this.tabPage2.Controls.Add(this.comboBox3);
            this.tabPage2.Controls.Add(this.label6);
            this.tabPage2.Controls.Add(this.label5);
            this.tabPage2.Controls.Add(this.label4);
            this.tabPage2.Location = new System.Drawing.Point(4, 24);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(777, 440);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Nuevo Requerimiento";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // button7
            // 
            this.button7.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.button7.Location = new System.Drawing.Point(417, 375);
            this.button7.Name = "button7";
            this.button7.Size = new System.Drawing.Size(158, 41);
            this.button7.TabIndex = 10;
            this.button7.Text = "Guardar Requerimiento";
            this.button7.UseVisualStyleBackColor = true;
            this.button7.Click += new System.EventHandler(this.SaveReqClick);
            // 
            // button6
            // 
            this.button6.Location = new System.Drawing.Point(189, 375);
            this.button6.Name = "button6";
            this.button6.Size = new System.Drawing.Size(158, 41);
            this.button6.TabIndex = 9;
            this.button6.Text = "Limpiar campos";
            this.button6.UseVisualStyleBackColor = true;
            this.button6.Click += new System.EventHandler(this.ClearReqFormClick);
            // 
            // comboBox5
            // 
            this.comboBox5.FormattingEnabled = true;
            this.comboBox5.Items.AddRange(new object[] {
            "Baja",
            "Media",
            "Alta"});
            this.comboBox5.Location = new System.Drawing.Point(158, 300);
            this.comboBox5.Name = "comboBox5";
            this.comboBox5.Size = new System.Drawing.Size(144, 23);
            this.comboBox5.TabIndex = 8;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(22, 308);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(58, 15);
            this.label8.TabIndex = 7;
            this.label8.Text = "Prioridad:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(22, 141);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(169, 15);
            this.label7.TabIndex = 6;
            this.label7.Text = "Descripción del requerimiento:";
            // 
            // richTextBox1
            // 
            this.richTextBox1.Location = new System.Drawing.Point(22, 170);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.Size = new System.Drawing.Size(438, 119);
            this.richTextBox1.TabIndex = 5;
            this.richTextBox1.Text = "";
            // 
            // comboBox4
            // 
            this.comboBox4.FormattingEnabled = true;
            this.comboBox4.Location = new System.Drawing.Point(158, 95);
            this.comboBox4.Name = "comboBox4";
            this.comboBox4.Size = new System.Drawing.Size(144, 23);
            this.comboBox4.TabIndex = 4;
            // 
            // comboBox3
            // 
            this.comboBox3.FormattingEnabled = true;
            this.comboBox3.Items.AddRange(new object[] {
            "Base de Datos",
            "Sistemas",
            "Servidores"});
            this.comboBox3.Location = new System.Drawing.Point(158, 53);
            this.comboBox3.Name = "comboBox3";
            this.comboBox3.Size = new System.Drawing.Size(144, 23);
            this.comboBox3.TabIndex = 3;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(22, 98);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(69, 15);
            this.label6.TabIndex = 2;
            this.label6.Text = "Asignado a:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(22, 56);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(130, 15);
            this.label5.TabIndex = 1;
            this.label5.Text = "Tipo de Requerimiento:";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label4.Location = new System.Drawing.Point(16, 13);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(244, 21);
            this.label4.TabIndex = 0;
            this.label4.Text = "Registrar nuevo requerimiento";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(717, 11);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(0, 15);
            this.label9.TabIndex = 13;
            // 
            // TabForm
            // 
            this.AcceptButton = this.button1;
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 492);
            this.Controls.Add(this.tabControl1);
            this.Name = "TabForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Sanitaria ACME";
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private TabControl tabControl1;
        private TabPage tabPage1;
        private Label label1;
        private TabPage tabPage2;
        private Label label3;
        private Label label2;
        private ComboBox comboBox2;
        private ComboBox comboBox1;
        private CheckBox checkBox2;
        private CheckBox checkBox1;
        private Button button1;
        private DataGridView dataGridView1;
        private Button button3;
        private Button button2;
        private Button button4;
        private DataGridViewTextBoxColumn id;
        private DataGridViewTextBoxColumn type;
        private DataGridViewTextBoxColumn priority;
        private DataGridViewTextBoxColumn description;
        private DataGridViewTextBoxColumn assigned;
        private DataGridViewTextBoxColumn status;
        private DataGridViewTextBoxColumn days;
        private Button button5;
        private Label label4;
        private ComboBox comboBox4;
        private ComboBox comboBox3;
        private Label label6;
        private Label label5;
        private Label label7;
        private RichTextBox richTextBox1;
        private Label label8;
        private ComboBox comboBox5;
        private Button button7;
        private Button button6;
        private Label label9;
    }
}