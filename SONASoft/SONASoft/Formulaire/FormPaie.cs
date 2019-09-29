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
    public partial class FormPaie : Form
    {
        public FormPaie()
        {
            InitializeComponent();
        }

        private void FormPaie_Load(object sender, EventArgs e)
        {
            DgvPaie.DataSource = Glossaire.Instance.LoadGrid("paie");
        }
    }
}
