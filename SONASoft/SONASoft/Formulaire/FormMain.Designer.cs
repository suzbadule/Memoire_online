namespace SONASoft.Formulaire
{
    partial class FormMain
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormMain));
            this.ribbonControl1 = new DevExpress.XtraBars.Ribbon.RibbonControl();
            this.BtnConnexion = new DevExpress.XtraBars.BarButtonItem();
            this.BtnDeconnexion = new DevExpress.XtraBars.BarButtonItem();
            this.BtnPersonnel = new DevExpress.XtraBars.BarButtonItem();
            this.BtnTechnique = new DevExpress.XtraBars.BarButtonItem();
            this.ribbonPage1 = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.ribbonPageGroup10 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPageGroup1 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPage2 = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.ribbonPageGroup2 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPageGroup3 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPage3 = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.ribbonPageGroup4 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPageGroup5 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPage5 = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.ribbonPageGroup8 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPageGroup9 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPage4 = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.ribbonPageGroup6 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPageGroup7 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonStatusBar1 = new DevExpress.XtraBars.Ribbon.RibbonStatusBar();
            this.xtraTabbedMdiManager1 = new DevExpress.XtraTabbedMdi.XtraTabbedMdiManager(this.components);
            this.PnlAccueil = new System.Windows.Forms.Panel();
            ((System.ComponentModel.ISupportInitialize)(this.ribbonControl1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.xtraTabbedMdiManager1)).BeginInit();
            this.SuspendLayout();
            // 
            // ribbonControl1
            // 
            this.ribbonControl1.ExpandCollapseItem.Id = 0;
            this.ribbonControl1.Items.AddRange(new DevExpress.XtraBars.BarItem[] {
            this.ribbonControl1.ExpandCollapseItem,
            this.BtnConnexion,
            this.BtnDeconnexion,
            this.BtnPersonnel,
            this.BtnTechnique});
            this.ribbonControl1.Location = new System.Drawing.Point(0, 0);
            this.ribbonControl1.MaxItemId = 6;
            this.ribbonControl1.Name = "ribbonControl1";
            this.ribbonControl1.Pages.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPage[] {
            this.ribbonPage1,
            this.ribbonPage2,
            this.ribbonPage3,
            this.ribbonPage5,
            this.ribbonPage4});
            this.ribbonControl1.Size = new System.Drawing.Size(1058, 143);
            this.ribbonControl1.StatusBar = this.ribbonStatusBar1;
            // 
            // BtnConnexion
            // 
            this.BtnConnexion.Caption = "Connexion";
            this.BtnConnexion.Id = 1;
            this.BtnConnexion.Name = "BtnConnexion";
            this.BtnConnexion.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.BtnConnexion.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.LoadForms_ItemClick);
            // 
            // BtnDeconnexion
            // 
            this.BtnDeconnexion.Caption = "Déconnexion";
            this.BtnDeconnexion.Id = 2;
            this.BtnDeconnexion.Name = "BtnDeconnexion";
            this.BtnDeconnexion.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.BtnDeconnexion.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.LoadForms_ItemClick);
            // 
            // BtnPersonnel
            // 
            this.BtnPersonnel.Caption = "Personnel";
            this.BtnPersonnel.Glyph = global::SONASoft.Properties.Resources.bodepartment_16x16;
            this.BtnPersonnel.Id = 3;
            this.BtnPersonnel.LargeGlyph = global::SONASoft.Properties.Resources.bodepartment_32x32;
            this.BtnPersonnel.Name = "BtnPersonnel";
            this.BtnPersonnel.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.BtnPersonnel.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.LoadForms_ItemClick);
            // 
            // BtnTechnique
            // 
            this.BtnTechnique.Caption = "Technique";
            this.BtnTechnique.Glyph = ((System.Drawing.Image)(resources.GetObject("BtnTechnique.Glyph")));
            this.BtnTechnique.Id = 4;
            this.BtnTechnique.LargeGlyph = ((System.Drawing.Image)(resources.GetObject("BtnTechnique.LargeGlyph")));
            this.BtnTechnique.Name = "BtnTechnique";
            this.BtnTechnique.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.BtnTechnique.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.LoadForms_ItemClick);
            // 
            // ribbonPage1
            // 
            this.ribbonPage1.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.ribbonPageGroup10,
            this.ribbonPageGroup1});
            this.ribbonPage1.Name = "ribbonPage1";
            this.ribbonPage1.Text = "Accueil";
            // 
            // ribbonPageGroup10
            // 
            this.ribbonPageGroup10.AllowTextClipping = false;
            this.ribbonPageGroup10.Name = "ribbonPageGroup10";
            this.ribbonPageGroup10.ShowCaptionButton = false;
            this.ribbonPageGroup10.Text = "Accueil";
            // 
            // ribbonPageGroup1
            // 
            this.ribbonPageGroup1.AllowTextClipping = false;
            this.ribbonPageGroup1.ItemLinks.Add(this.BtnConnexion);
            this.ribbonPageGroup1.ItemLinks.Add(this.BtnDeconnexion);
            this.ribbonPageGroup1.Name = "ribbonPageGroup1";
            this.ribbonPageGroup1.ShowCaptionButton = false;
            this.ribbonPageGroup1.Text = "Authentification";
            // 
            // ribbonPage2
            // 
            this.ribbonPage2.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.ribbonPageGroup2,
            this.ribbonPageGroup3});
            this.ribbonPage2.Name = "ribbonPage2";
            this.ribbonPage2.Text = "Personnel";
            // 
            // ribbonPageGroup2
            // 
            this.ribbonPageGroup2.AllowTextClipping = false;
            this.ribbonPageGroup2.ItemLinks.Add(this.BtnPersonnel);
            this.ribbonPageGroup2.Name = "ribbonPageGroup2";
            this.ribbonPageGroup2.ShowCaptionButton = false;
            this.ribbonPageGroup2.Text = "Personnel";
            // 
            // ribbonPageGroup3
            // 
            this.ribbonPageGroup3.AllowTextClipping = false;
            this.ribbonPageGroup3.Name = "ribbonPageGroup3";
            this.ribbonPageGroup3.ShowCaptionButton = false;
            // 
            // ribbonPage3
            // 
            this.ribbonPage3.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.ribbonPageGroup4,
            this.ribbonPageGroup5});
            this.ribbonPage3.Name = "ribbonPage3";
            this.ribbonPage3.Text = "Technique";
            // 
            // ribbonPageGroup4
            // 
            this.ribbonPageGroup4.AllowTextClipping = false;
            this.ribbonPageGroup4.ItemLinks.Add(this.BtnTechnique);
            this.ribbonPageGroup4.Name = "ribbonPageGroup4";
            this.ribbonPageGroup4.ShowCaptionButton = false;
            this.ribbonPageGroup4.Text = "Service technique";
            // 
            // ribbonPageGroup5
            // 
            this.ribbonPageGroup5.AllowTextClipping = false;
            this.ribbonPageGroup5.Name = "ribbonPageGroup5";
            this.ribbonPageGroup5.ShowCaptionButton = false;
            // 
            // ribbonPage5
            // 
            this.ribbonPage5.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.ribbonPageGroup8,
            this.ribbonPageGroup9});
            this.ribbonPage5.Name = "ribbonPage5";
            this.ribbonPage5.Text = "Sinistre";
            // 
            // ribbonPageGroup8
            // 
            this.ribbonPageGroup8.Name = "ribbonPageGroup8";
            this.ribbonPageGroup8.Text = "ribbonPageGroup8";
            // 
            // ribbonPageGroup9
            // 
            this.ribbonPageGroup9.Name = "ribbonPageGroup9";
            this.ribbonPageGroup9.Text = "ribbonPageGroup9";
            // 
            // ribbonPage4
            // 
            this.ribbonPage4.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.ribbonPageGroup6,
            this.ribbonPageGroup7});
            this.ribbonPage4.Name = "ribbonPage4";
            this.ribbonPage4.Text = "Paramètre";
            // 
            // ribbonPageGroup6
            // 
            this.ribbonPageGroup6.AllowTextClipping = false;
            this.ribbonPageGroup6.Name = "ribbonPageGroup6";
            this.ribbonPageGroup6.ShowCaptionButton = false;
            this.ribbonPageGroup6.Text = "Analyse des données";
            // 
            // ribbonPageGroup7
            // 
            this.ribbonPageGroup7.AllowTextClipping = false;
            this.ribbonPageGroup7.Name = "ribbonPageGroup7";
            this.ribbonPageGroup7.ShowCaptionButton = false;
            this.ribbonPageGroup7.Text = "Impression des rapports";
            // 
            // ribbonStatusBar1
            // 
            this.ribbonStatusBar1.Location = new System.Drawing.Point(0, 595);
            this.ribbonStatusBar1.Name = "ribbonStatusBar1";
            this.ribbonStatusBar1.Ribbon = this.ribbonControl1;
            this.ribbonStatusBar1.Size = new System.Drawing.Size(1058, 31);
            // 
            // xtraTabbedMdiManager1
            // 
            this.xtraTabbedMdiManager1.MdiParent = this;
            // 
            // PnlAccueil
            // 
            this.PnlAccueil.BackgroundImage = global::SONASoft.Properties.Resources.sonas;
            this.PnlAccueil.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.PnlAccueil.Dock = System.Windows.Forms.DockStyle.Fill;
            this.PnlAccueil.Location = new System.Drawing.Point(0, 143);
            this.PnlAccueil.Name = "PnlAccueil";
            this.PnlAccueil.Size = new System.Drawing.Size(1058, 452);
            this.PnlAccueil.TabIndex = 3;
            // 
            // FormMain
            // 
            this.Appearance.BackColor = System.Drawing.Color.White;
            this.Appearance.Options.UseBackColor = true;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1058, 626);
            this.Controls.Add(this.PnlAccueil);
            this.Controls.Add(this.ribbonStatusBar1);
            this.Controls.Add(this.ribbonControl1);
            this.IsMdiContainer = true;
            this.Name = "FormMain";
            this.Ribbon = this.ribbonControl1;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.StatusBar = this.ribbonStatusBar1;
            this.Text = "SONAS Soft";
            ((System.ComponentModel.ISupportInitialize)(this.ribbonControl1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.xtraTabbedMdiManager1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DevExpress.XtraBars.Ribbon.RibbonControl ribbonControl1;
        private DevExpress.XtraBars.Ribbon.RibbonPage ribbonPage1;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup1;
        private DevExpress.XtraBars.BarButtonItem BtnConnexion;
        private DevExpress.XtraBars.BarButtonItem BtnDeconnexion;
        private DevExpress.XtraBars.BarButtonItem BtnPersonnel;
        private DevExpress.XtraBars.BarButtonItem BtnTechnique;
        private DevExpress.XtraBars.Ribbon.RibbonPage ribbonPage2;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup2;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup3;
        private DevExpress.XtraBars.Ribbon.RibbonPage ribbonPage3;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup4;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup5;
        private DevExpress.XtraBars.Ribbon.RibbonPage ribbonPage4;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup6;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup7;
        private DevExpress.XtraBars.Ribbon.RibbonStatusBar ribbonStatusBar1;
        private DevExpress.XtraTabbedMdi.XtraTabbedMdiManager xtraTabbedMdiManager1;
        private System.Windows.Forms.Panel PnlAccueil;
        private DevExpress.XtraBars.Ribbon.RibbonPage ribbonPage5;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup10;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup8;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup9;
    }
}