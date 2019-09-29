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
    public partial class FormPersonnel : Form
    {
        private Form form = null;

        public FormPersonnel()
        {
            InitializeComponent();
        }

        private void FormPersonnel_Load(object sender, EventArgs e)
        {
            DgvAgent.DataSource = Glossaire.Instance.LoadGrid("agent");
            DgvService.DataSource = Glossaire.Instance.LoadGrid("service");
            DgvConge.DataSource = Glossaire.Instance.LoadGrid("conge");
        }

        private void button13_Click(object sender, EventArgs e)
        {
            form = new FormPresence();
            form.ShowDialog(this);
        }

        private void button16_Click(object sender, EventArgs e)
        {
            form = new FormPaie();
            form.ShowDialog(this);
        }
    }
}
