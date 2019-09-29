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
    public partial class FormPresence : Form
    {
        public FormPresence()
        {
            InitializeComponent();
        }

        private void FormPresence_Load(object sender, EventArgs e)
        {
            DgvPres.DataSource = Glossaire.Instance.LoadGrid("presence");
        }
    }
}
