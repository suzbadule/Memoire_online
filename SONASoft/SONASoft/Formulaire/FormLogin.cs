using Librairie.Classes;
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
    public partial class FormLogin : Form
    {
        private Connection con = null;
        private User user = null;

        public FormLogin()
        {
            InitializeComponent();

            con = new Connection();

            con.Server = "localhost";
            con.Database = "sonas_bdd";
            con.User = "root";
            con.Password = "root";
        }

        private void FormLogin_Load(object sender, EventArgs e)
        {
            try
            {
                ImplementConnection.Instance.Initialize(con, ConnectionType.MySQL);
                ImplementConnection.Instance.Con.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(this, "Erreur de connexion. \nMessage : " + ex.Message.ToString(), "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void BtnConnection_Click(object sender, EventArgs e)
        {
            Login();
        }

        private void Login()
        {
            try
            {
                if (string.IsNullOrWhiteSpace(TextUsername.Text.Trim()))
                {
                    MessageBox.Show(this, "Saisissez votre nom d'utilisateur", "Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                else if (string.IsNullOrWhiteSpace(TextPassword.Text.Trim()))
                {
                    MessageBox.Show(this, "Saisissez votre mot de passe", "Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                else
                {
                    user = Glossaire.Instance.GetLogin(TextUsername.Text.Trim(), TextPassword.Text);

                    if (user == null)
                    {
                        MessageBox.Show(this, "Identifiants incorrectes", "Message", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        TextUsername.Focus();
                    }
                    else
                    {
                        User.Instance.UpdateOnlineStatus(user);
                        this.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(this, "Une erreur s'est produite. \nMessage : " + ex.Message.ToString(), "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
