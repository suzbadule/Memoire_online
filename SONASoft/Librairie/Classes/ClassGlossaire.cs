using Librairie.Classes.Connection;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Windows.Forms;

namespace Librairie.Classes
{
    public class Glossaire
    {
        static Glossaire _instance = null;
        private MySqlDataAdapter adapter = null;
        private DataSet dataset = null;
        private User user = null;

        public IDbDataParameter GetParameter(IDbCommand command, string name, int length, DbType type, object value)
        {
            IDbDataParameter a = command.CreateParameter();
            a.ParameterName = name;
            a.DbType = type;
            a.Size = length;
            a.Value = value;

            return a;
        }

        public static Glossaire Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new Glossaire();
                return _instance;
            }
        }

        public void InitializeConnexion()
        {
            try
            {
                if (ImplementConnection.Instance.Con.State == ConnectionState.Closed)
                    ImplementConnection.Instance.Con.Open();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        public DataTable LoadGrid(string table, string orderBy = "id")
        {
            InitializeConnexion();

            using (IDbCommand cmd = ImplementConnection.Instance.Con.CreateCommand())
            {
                cmd.CommandText = "SELECT * FROM `sonas_bdd`.`" + table + "` ORDER BY `" + orderBy + "` DESC";
                DataTable dt = new DataTable();
                adapter = new MySqlDataAdapter((MySqlCommand)cmd);
                adapter.Fill(dt);

                return dt;
            }
        }

        public void LoadCombos(string field, string table, System.Windows.Forms.ComboBox combo)
        {
            InitializeConnexion();

            combo.Items.Clear();

            using (IDbCommand cmd = ImplementConnection.Instance.Con.CreateCommand())
            {
                cmd.CommandText = "SELECT `" + field + "` FROM `sonas_bdd`.`" + table + "`";

                IDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    combo.Items.Add(dr[field]).ToString();
                }

                dr.Dispose();
                dr.Close();
            }
        }

        public List<string> LoadString(string field, string table)
        {
            InitializeConnexion();

            List<string> list = new List<string>();

            using (IDbCommand cmd = ImplementConnection.Instance.Con.CreateCommand())
            {
                cmd.CommandText = "SELECT `" + field + "` FROM `sonas_bdd`.`" + table + "` ORDER BY `" + field + "` ";

                IDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    list.Add(dr[field].ToString());
                }

                dr.Dispose();
                dr.Close();
            }

            return list;
        }

        public int SelectId(string table, string field, string value)
        {
            InitializeConnexion();

            int id = 0;

            using (IDbCommand cmd = ImplementConnection.Instance.Con.CreateCommand())
            {
                if (field.Contains("'"))
                {
                    int index = field.IndexOf("'");
                    field = field.Insert(index + 1, "'");
                }

                cmd.CommandText = "SELECT id FROM `sonas_bdd`.`" + table + "` WHERE `" + field + "` = '" + value + "'";

                IDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    id = Convert.ToInt32(dr["id"].ToString());
                }

                dr.Dispose();
                dr.Close();
            }

            return id;
        }

        public void Delete(string table, int id)
        {
            InitializeConnexion();

            using (IDbCommand cmd = ImplementConnection.Instance.Con.CreateCommand())
            {
                cmd.CommandText = "DELETE FROM `sonas_bdd`.`" + table + "` WHERE id = @id ;";

                cmd.Parameters.Add(GetParameter(cmd, "@id", 4, DbType.Int32, id));

                int record = cmd.ExecuteNonQuery();

                if (record == 0)
                    throw new InvalidOperationException("That id does not exist !");
            }
        }

        public User GetLogin(string username, string password)
        {
            InitializeConnexion();

            using (IDbCommand cmd = ImplementConnection.Instance.Con.CreateCommand())
            {
                cmd.CommandText = "SELECT `username`,`niveau` FROM `sonas_bdd`.`utilisateur` " +
                    " WHERE `username`=`" + username + "` AND `password` = `" + password + "`";

                IDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    user = new User();
                    user.Username = dr["username"].ToString();
                }

                dr.Dispose();
                dr.Close();

                return user;
            }
        }

        public void InsertUpdateTypeAssurance(TypeAssurance obj)
        {
            InitializeConnexion();

            using (IDbCommand cmd = ImplementConnection.Instance.Con.CreateCommand())
            {
                if (obj.Id == 0)
                {
                    cmd.CommandText = "INSERT INTO `sonas_bdd`.`type_assurance` (`designation`) " +
                        "VALUES (@designation);";

                    cmd.Parameters.Add(GetParameter(cmd, "@designation", 50, DbType.String, obj.Designation));
                }
                else
                {
                    cmd.CommandText = "UPDATE `sonas_bdd`.`type_assurance` SET `designation` = @designation " +
                        "WHERE `id` = @id ;";

                    cmd.Parameters.Add(GetParameter(cmd, "@id", 4, DbType.Int32, obj.Id));
                    cmd.Parameters.Add(GetParameter(cmd, "@designation", 50, DbType.String, obj.Designation));
                }

                cmd.ExecuteNonQuery();
            }
        }

        public void InsertUpdatePaie(Paie obj)
        {
            InitializeConnexion();

            using (IDbCommand cmd = ImplementConnection.Instance.Con.CreateCommand())
            {
                if (obj.Id == 0)
                {
                    cmd.CommandText = "INSERT INTO `sonas_bdd`.`paie`(`annee`,`Janvier`,`Fevrier`,`Mars`," +
                        "`Avril`,`Mai`,`Juin`,`Juillet`,`Aout`,`Septembre`,`Octobre`,`Novembre`,`Decembre`) " +
                        " VALUES (@annee,@Janvier,@Fevrier,@Mars,@Avril,@Mai,@Juin,@Juillet,@Aout,@Septembre, " + 
                        "@Octobre,@Novembre,@Decembre); ";

                    cmd.Parameters.Add(GetParameter(cmd, "@annee", 50, DbType.String, obj.Annee));
                    cmd.Parameters.Add(GetParameter(cmd, "@Janvier", 50, DbType.String, obj.Janvier));
                    cmd.Parameters.Add(GetParameter(cmd, "@Fevrier", 50, DbType.String, obj.Fevrier));
                    cmd.Parameters.Add(GetParameter(cmd, "@Mars", 50, DbType.String, obj.Mars));
                    cmd.Parameters.Add(GetParameter(cmd, "@Avril", 50, DbType.String, obj.Avril));
                    cmd.Parameters.Add(GetParameter(cmd, "@Mai", 50, DbType.String, obj.Mai));
                    cmd.Parameters.Add(GetParameter(cmd, "@Juin", 50, DbType.String, obj.Juin));
                    cmd.Parameters.Add(GetParameter(cmd, "@Juillet", 50, DbType.String, obj.Juillet));
                    cmd.Parameters.Add(GetParameter(cmd, "@Aout", 50, DbType.String, obj.Avril));
                    cmd.Parameters.Add(GetParameter(cmd, "@Septembre", 50, DbType.String, obj.Septembre));
                    cmd.Parameters.Add(GetParameter(cmd, "@Octobre", 50, DbType.String, obj.Octobre));
                    cmd.Parameters.Add(GetParameter(cmd, "@Novembre", 50, DbType.String, obj.Novembre));
                    cmd.Parameters.Add(GetParameter(cmd, "@Decembre", 50, DbType.String, obj.Decembre));
                }
                else
                {
                    cmd.CommandText = "UPDATE `sonas_bdd`.`paie` SET `annee` = @annee,`Janvier` = @Janvier, " +
                        "`Fevrier` = @Fevrier,`Mars` = @Mars,`Avril` = @Avril,`Mai` = @Mai,`Juin` = @Juin, " + 
                        "`Juillet` = @Juillet,`Aout` = @Aout,`Septembre` = @Septembre,`Octobre` = @Octobre, " + 
                        "`Novembre` = @Novembre,`Decembre` = @Decembre WHERE `id` = @id; ";

                    cmd.Parameters.Add(GetParameter(cmd, "@id", 4, DbType.Int32, obj.Id));
                    cmd.Parameters.Add(GetParameter(cmd, "@annee", 50, DbType.String, obj.Annee));
                    cmd.Parameters.Add(GetParameter(cmd, "@Janvier", 50, DbType.String, obj.Janvier));
                    cmd.Parameters.Add(GetParameter(cmd, "@Fevrier", 50, DbType.String, obj.Fevrier));
                    cmd.Parameters.Add(GetParameter(cmd, "@Mars", 50, DbType.String, obj.Mars));
                    cmd.Parameters.Add(GetParameter(cmd, "@Avril", 50, DbType.String, obj.Avril));
                    cmd.Parameters.Add(GetParameter(cmd, "@Mai", 50, DbType.String, obj.Mai));
                    cmd.Parameters.Add(GetParameter(cmd, "@Juin", 50, DbType.String, obj.Juin));
                    cmd.Parameters.Add(GetParameter(cmd, "@Juillet", 50, DbType.String, obj.Juillet));
                    cmd.Parameters.Add(GetParameter(cmd, "@Aout", 50, DbType.String, obj.Avril));
                    cmd.Parameters.Add(GetParameter(cmd, "@Septembre", 50, DbType.String, obj.Septembre));
                    cmd.Parameters.Add(GetParameter(cmd, "@Octobre", 50, DbType.String, obj.Octobre));
                    cmd.Parameters.Add(GetParameter(cmd, "@Novembre", 50, DbType.String, obj.Novembre));
                    cmd.Parameters.Add(GetParameter(cmd, "@Decembre", 50, DbType.String, obj.Decembre));
                }

                cmd.ExecuteNonQuery();
            }
        }

        public void InsertUpdatePresence(Presence obj)
        {
            InitializeConnexion();

            using (IDbCommand cmd = ImplementConnection.Instance.Con.CreateCommand())
            {
                if (obj.Id == 0)
                {
                    cmd.CommandText = "INSERT INTO `sonas_bdd`.`presence`(`annee`,`Janvier`,`Fevrier`,`Mars`," +
                        "`Avril`,`Mai`,`Juin`,`Juillet`,`Aout`,`Septembre`,`Octobre`,`Novembre`,`Decembre`) " +
                        " VALUES (@annee,@Janvier,@Fevrier,@Mars,@Avril,@Mai,@Juin,@Juillet,@Aout,@Septembre, " +
                        "@Octobre,@Novembre,@Decembre); ";

                    cmd.Parameters.Add(GetParameter(cmd, "@annee", 50, DbType.String, obj.Annee));
                    cmd.Parameters.Add(GetParameter(cmd, "@Janvier", 50, DbType.String, obj.Janvier));
                    cmd.Parameters.Add(GetParameter(cmd, "@Fevrier", 50, DbType.String, obj.Fevrier));
                    cmd.Parameters.Add(GetParameter(cmd, "@Mars", 50, DbType.String, obj.Mars));
                    cmd.Parameters.Add(GetParameter(cmd, "@Avril", 50, DbType.String, obj.Avril));
                    cmd.Parameters.Add(GetParameter(cmd, "@Mai", 50, DbType.String, obj.Mai));
                    cmd.Parameters.Add(GetParameter(cmd, "@Juin", 50, DbType.String, obj.Juin));
                    cmd.Parameters.Add(GetParameter(cmd, "@Juillet", 50, DbType.String, obj.Juillet));
                    cmd.Parameters.Add(GetParameter(cmd, "@Aout", 50, DbType.String, obj.Avril));
                    cmd.Parameters.Add(GetParameter(cmd, "@Septembre", 50, DbType.String, obj.Septembre));
                    cmd.Parameters.Add(GetParameter(cmd, "@Octobre", 50, DbType.String, obj.Octobre));
                    cmd.Parameters.Add(GetParameter(cmd, "@Novembre", 50, DbType.String, obj.Novembre));
                    cmd.Parameters.Add(GetParameter(cmd, "@Decembre", 50, DbType.String, obj.Decembre));
                }
                else
                {
                    cmd.CommandText = "UPDATE `sonas_bdd`.`presence` SET `annee` = @annee,`Janvier` = @Janvier, " +
                        "`Fevrier` = @Fevrier,`Mars` = @Mars,`Avril` = @Avril,`Mai` = @Mai,`Juin` = @Juin, " +
                        "`Juillet` = @Juillet,`Aout` = @Aout,`Septembre` = @Septembre,`Octobre` = @Octobre, " +
                        "`Novembre` = @Novembre,`Decembre` = @Decembre WHERE `id` = @id; ";

                    cmd.Parameters.Add(GetParameter(cmd, "@id", 4, DbType.Int32, obj.Id));
                    cmd.Parameters.Add(GetParameter(cmd, "@annee", 50, DbType.String, obj.Annee));
                    cmd.Parameters.Add(GetParameter(cmd, "@Janvier", 50, DbType.String, obj.Janvier));
                    cmd.Parameters.Add(GetParameter(cmd, "@Fevrier", 50, DbType.String, obj.Fevrier));
                    cmd.Parameters.Add(GetParameter(cmd, "@Mars", 50, DbType.String, obj.Mars));
                    cmd.Parameters.Add(GetParameter(cmd, "@Avril", 50, DbType.String, obj.Avril));
                    cmd.Parameters.Add(GetParameter(cmd, "@Mai", 50, DbType.String, obj.Mai));
                    cmd.Parameters.Add(GetParameter(cmd, "@Juin", 50, DbType.String, obj.Juin));
                    cmd.Parameters.Add(GetParameter(cmd, "@Juillet", 50, DbType.String, obj.Juillet));
                    cmd.Parameters.Add(GetParameter(cmd, "@Aout", 50, DbType.String, obj.Avril));
                    cmd.Parameters.Add(GetParameter(cmd, "@Septembre", 50, DbType.String, obj.Septembre));
                    cmd.Parameters.Add(GetParameter(cmd, "@Octobre", 50, DbType.String, obj.Octobre));
                    cmd.Parameters.Add(GetParameter(cmd, "@Novembre", 50, DbType.String, obj.Novembre));
                    cmd.Parameters.Add(GetParameter(cmd, "@Decembre", 50, DbType.String, obj.Decembre));
                }

                cmd.ExecuteNonQuery();
            }
        }

        public void InsertUpdateService(Service obj)
        {
            InitializeConnexion();

            using (IDbCommand cmd = ImplementConnection.Instance.Con.CreateCommand())
            {
                if (obj.Id == 0)
                {
                    cmd.CommandText = "INSERT INTO `sonas_bdd`.`service` (`designation`,`fonctionnalite`) " +
                        "VALUES (@designation,@fonctionnalite);";

                    cmd.Parameters.Add(GetParameter(cmd, "@designation", 50, DbType.String, obj.Designation));
                    cmd.Parameters.Add(GetParameter(cmd, "@fonctionnalite", 50, DbType.String, obj.Fonctionnalite));
                }
                else
                {
                    cmd.CommandText = "UPDATE `sonas_bdd`.`service` SET `designation` = @designation, " +
                        " `fonctionnalite` = @fonctionnalite WHERE `id` = @id ;";

                    cmd.Parameters.Add(GetParameter(cmd, "@id", 4, DbType.Int32, obj.Id));
                    cmd.Parameters.Add(GetParameter(cmd, "@designation", 50, DbType.String, obj.Designation));
                    cmd.Parameters.Add(GetParameter(cmd, "@fonctionnalite", 50, DbType.String, obj.Fonctionnalite));
                }

                cmd.ExecuteNonQuery();
            }
        }

        public void InsertUpdateConge(Conge obj)
        {
            InitializeConnexion();

            using (IDbCommand cmd = ImplementConnection.Instance.Con.CreateCommand())
            {
                if (obj.Id == 0)
                {
                    cmd.CommandText = "INSERT INTO `sonas_bdd`.`conge` (`designation`,`date_debut`,`date_fin`) " +
                        "VALUES (@designation,@date_debut,@date_fin);";

                    cmd.Parameters.Add(GetParameter(cmd, "@designation", 50, DbType.String, obj.Designation));
                    cmd.Parameters.Add(GetParameter(cmd, "@date_debut", 50, DbType.String, obj.DateDebut));
                    cmd.Parameters.Add(GetParameter(cmd, "@date_fin", 50, DbType.String, obj.DateFin));
                }
                else
                {
                    cmd.CommandText = "UPDATE `sonas_bdd`.`service` SET `designation` = @designation, " +
                        " `date_debut` = @date_debut, `date_fin` = @date_fin WHERE `id` = @id ;";

                    cmd.Parameters.Add(GetParameter(cmd, "@id", 4, DbType.Int32, obj.Id));
                    cmd.Parameters.Add(GetParameter(cmd, "@designation", 50, DbType.String, obj.Designation));
                    cmd.Parameters.Add(GetParameter(cmd, "@date_debut", 50, DbType.String, obj.DateDebut));
                    cmd.Parameters.Add(GetParameter(cmd, "@date_fin", 50, DbType.String, obj.DateFin));
                }

                cmd.ExecuteNonQuery();
            }
        }

        public void InsertUpdateAgent(Agent agent)
        {
            InitializeConnexion();

            using (IDbCommand cmd = ImplementConnection.Instance.Con.CreateCommand())
            {
                if (agent.Id == 0)
                {
                    cmd.CommandText = "INSERT INTO `sonas_bdd`.`agent` (`matricule`,`nom`,`adresse`,`email`, " + 
                        "`id_service`,`id_conge`,`id_paie`,`id_presence`) VALUES (@matricule,@nom,@adresse, " +
                        "@email,@id_service,@id_conge,@id_paie,@id_presence); ";

                    cmd.Parameters.Add(GetParameter(cmd, "@nom", 50, DbType.String, agent.Nom));
                    cmd.Parameters.Add(GetParameter(cmd, "@matricule", 50, DbType.String, agent.Matricule));
                    cmd.Parameters.Add(GetParameter(cmd, "@adresse", 50, DbType.String, agent.Adresse));
                    cmd.Parameters.Add(GetParameter(cmd, "@email", 50, DbType.String, agent.Email));
                    cmd.Parameters.Add(GetParameter(cmd, "@id_service", 4, DbType.Int32, agent.RefService));
                    cmd.Parameters.Add(GetParameter(cmd, "@id_conge", 4, DbType.Int32, agent.RefConge));
                    cmd.Parameters.Add(GetParameter(cmd, "@id_paie", 4, DbType.Int32, agent.RefPaie));
                    cmd.Parameters.Add(GetParameter(cmd, "@id_presence", 4, DbType.Int32, agent.RefPresence));

                }
                else
                {
                    cmd.CommandText = "UPDATE `sonas_bdd`.`agent` SET `matricule` = @matricule, `nom` = @nom, " +
                        "`adresse` = @adresse, `email` = @email, `id_service` = @id_service, `id_conge` = @id_conge, " +
                        "`id_paie` = @id_paie, `id_presence` = @id_presence WHERE `id` = @id;";

                    cmd.Parameters.Add(GetParameter(cmd, "@id", 4, DbType.Int32, agent.Id));
                    cmd.Parameters.Add(GetParameter(cmd, "@nom", 50, DbType.String, agent.Nom));
                    cmd.Parameters.Add(GetParameter(cmd, "@matricule", 50, DbType.String, agent.Matricule));
                    cmd.Parameters.Add(GetParameter(cmd, "@adresse", 50, DbType.String, agent.Adresse));
                    cmd.Parameters.Add(GetParameter(cmd, "@email", 50, DbType.String, agent.Email));
                    cmd.Parameters.Add(GetParameter(cmd, "@id_service", 4, DbType.Int32, agent.RefService));
                    cmd.Parameters.Add(GetParameter(cmd, "@id_conge", 4, DbType.Int32, agent.RefConge));
                    cmd.Parameters.Add(GetParameter(cmd, "@id_paie", 4, DbType.Int32, agent.RefPaie));
                    cmd.Parameters.Add(GetParameter(cmd, "@id_presence", 4, DbType.Int32, agent.RefPresence));
                }

                cmd.ExecuteNonQuery();
            }
        }

    }
}
