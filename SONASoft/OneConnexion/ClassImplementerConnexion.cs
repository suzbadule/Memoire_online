using MySql.Data.MySqlClient;
using System.Data;

namespace OneConnexion
{
    public class ImplementerConnexion : IConnexion
    {
        private IDbConnection _conn = null;
        private static ImplementerConnexion _instance = null;

        public IDbConnection Con
        {
            get
            {
                return _conn;
            }

            set
            {
                _conn = value;
            }
        }

        public static ImplementerConnexion Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new ImplementerConnexion();
                return _instance;
            }
        }

        public IDbConnection Initialise(Connexion connexion, TypeConnexion type)
        {
            switch (type)
            {
                case TypeConnexion.SQLServer:
                    //_conn = new SqlConnection(string.Format("Data source={0};Initial catalog={1};User ID={2};Password={3}",
                    //    connection.Server, connection.Database, connection.User, connection.Password));
                    break;
                case TypeConnexion.MySQL:
                    _conn = new MySqlConnection(string.Format("Server={0};Database={1};UserID={2};Password={3}",
                        connexion.Server, connexion.Database, connexion.User, connexion.Password));
                    return null;
                case TypeConnexion.PostGrsSQL:
                    //_conn = new NpgsqlConnection(string.Format("Server={0};Database={1};Uid={2};Pwd={3};Port={4}",
                    //    connection.Serveur, connection.Database, connection.User, connection.Password, connection.Port));
                    return null;
                case TypeConnexion.Oracle:
                    return null;
                case TypeConnexion.Access:
                    return null;
            }
            return _conn;
        }
    }    
}
