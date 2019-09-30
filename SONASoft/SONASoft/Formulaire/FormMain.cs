using DevExpress.XtraEditors;
using Librairie.Classes.Connection;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SONASoft.Formulaire
{
    public partial class FormMain : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        private Form form = null;
        private Connection con = null;

        public FormMain()
        {
            InitializeComponent();
        }

        private void SelectForms(string nomForm)
        {
            try
            {
                switch (nomForm)
                {
                    case "Personnel":
                        form = new FormPersonnel
                        {
                            MdiParent = this,
                        };
                        if (form.IsMdiChild)
                        {
                            form.Show();
                        }
                        break;

                    case "Technique":
                        form = new FormTechnique
                        {
                            MdiParent = this,
                        };
                        if (form.IsMdiChild)
                        {
                            form.Show();
                        }
                        break;

                    case "Analyse":
                        form = new FormAnalyse
                        {
                            MdiParent = this,
                        };
                        if (form.IsMdiChild)
                        {
                            form.Show();
                        }
                        break;

                    case "Rapport":
                        form = new FormRapport
                        {
                            MdiParent = this,
                        };
                        if (form.IsMdiChild)
                        {
                            form.Show();
                        }
                        break;

                    case "Connexion":
                        form = new FormLogin
                        {
                            Icon = Icon,
                            ShowInTaskbar = false,
                        };
                        form.ShowDialog(this);
                        break;

                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void LoadForms_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            string s = e.Link.Item.Name.Substring(3);
            PnlAccueil.Visible = false;
            SelectForms(s);
        }

        private void FormMain_Load(object sender, EventArgs e)
        {
            con = new Connection();

            con.Server = "localhost";
            con.Database = "sonas_bdd";
            con.User = "root";
            con.Password = "root";

            ImplementConnection.Instance.Initialize(con, ConnectionType.MySQL);
            ImplementConnection.Instance.Con.Open();
        }
    }
}
