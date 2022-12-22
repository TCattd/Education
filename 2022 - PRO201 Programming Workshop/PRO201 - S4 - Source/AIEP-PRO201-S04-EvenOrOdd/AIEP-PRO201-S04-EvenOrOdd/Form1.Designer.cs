namespace AIEP_PRO201_S04_EvenOrOdd
{
    partial class Form1
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
            this.Evaluar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.number = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // Evaluar
            // 
            this.Evaluar.Location = new System.Drawing.Point(328, 28);
            this.Evaluar.Name = "Evaluar";
            this.Evaluar.Size = new System.Drawing.Size(75, 23);
            this.Evaluar.TabIndex = 0;
            this.Evaluar.Text = "Evaluar";
            this.Evaluar.UseVisualStyleBackColor = true;
            this.Evaluar.Click += new System.EventHandler(this.Evaluar_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(21, 31);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(90, 15);
            this.label1.TabIndex = 1;
            this.label1.Text = "Ingrese número";
            // 
            // number
            // 
            this.number.Location = new System.Drawing.Point(129, 28);
            this.number.Name = "number";
            this.number.Size = new System.Drawing.Size(168, 23);
            this.number.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(129, 73);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(0, 15);
            this.label2.TabIndex = 3;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(431, 219);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.number);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Evaluar);
            this.Name = "Form1";
            this.Text = "¿Par o Impar?";
            this.Load += new System.EventHandler(this.Form1_Load_1);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Button Evaluar;
        private Label label1;
        private TextBox number;
        private Label label2;
    }
}