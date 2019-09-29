using Librairie.Classes;
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
    public partial class FormTechnique : Form
    {
        public FormTechnique()
        {
            InitializeComponent();
        }

        private void FormTechnique_Load(object sender, EventArgs e)
        {
            DgvAssure.DataSource = Glossaire.Instance.LoadGrid("assure");
            DgvQuitant.DataSource = Glossaire.Instance.LoadGrid("assurance");
            DgvTypeAss.DataSource = Glossaire.Instance.LoadGrid("type_assurance");
            DgvVente.DataSource = Glossaire.Instance.LoadGrid("acheter");
        }
    }
}
