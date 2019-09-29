using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Librairie.Classes.Connection
{
    public class ImplementConnection : IConnection
    {
        private IDbConnection _con = null;
        private static ImplementConnection _instance = null;

        public IDbConnection Con
        {
            get
            {
                return _con;
            }

            set
            {
                _con = value;
            }
        }

        public static ImplementConnection Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new ImplementConnection();
                return _instance;
            }
        }

        public IDbConnection Initialize(Connection connection, ConnectionType connectionType)
        {
            switch (connectionType)
            {
                case ConnectionType.MySQL:
                    _con = new MySqlConnection(string.Format("Server={0};Database={1};UserID={2};Password={3}",
                    connection.Server, connection.Database, connection.User, connection.Password));
                    break;
                case ConnectionType.Access:
                    return null;
            }

            return _con;
        }    
    }
}

