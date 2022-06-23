using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Collections;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// SqlHelper 的摘要说明
/// </summary>
public class SqlHelper
{

    public static readonly string connstring = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
    private static Hashtable parmCache = Hashtable.Synchronized(new Hashtable());
    private SqlConnection con;
    private SqlCommand cmd;

    private SqlDataAdapter sda;
    private SqlDataReader sdr;
    private DataSet ds;
    private DataView dv;



    public static SqlConnection getConnection()//定义成静态的，很重要！
    {
        return new SqlConnection(ConfigurationManager.ConnectionStrings["connStr"].ConnectionString);
    }
    /// <summary>
    /// 打开数据库连接
    /// </summary>
    public void OpenDataBase()
    {
        con = new SqlConnection(connstring);
        con.Open();
    }
    /// <summary>
    /// 关闭数据库连接
    /// </summary>
    public void CloseDataBase()
    {

        con.Close();
        con.Dispose();

    }
    /// <summary>
    /// 返回DataSet数据集
    /// </summary>
    /// <param name="SqlStr">数据库查询字符串</param>
    /// <returns>dataset</returns>
    public DataSet GetDs(string SqlStr, string TableName)
    {
        OpenDataBase();
        sda = new SqlDataAdapter(SqlStr, con);
        ds = new DataSet();
        sda.Fill(ds, TableName);
        CloseDataBase();
        return ds;
    }
    public DataView GetDv(string SqlStr)
    {
        OpenDataBase();
        sda = new SqlDataAdapter(SqlStr, con);
        ds = new DataSet();
        sda.Fill(ds);
        dv = ds.Tables[0].DefaultView;
        CloseDataBase();
        return dv;

    }
    /// <summary>
    /// 返回Datareader对象
    /// </summary>
    /// <param name="Sqlstr">查询字符串</param>
    /// <returns>返回值</returns>
    public SqlDataReader GetDataReader(string Sqlstr)
    {
        OpenDataBase();
        cmd = new SqlCommand(Sqlstr, con);
        sdr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        return sdr;
    }

    /// <summary>
    /// 执行Sql语句方法没有返回值
    /// </summary>
    /// <param name="SqlStr">传入的查询参数</param>
    public void RunSql(string SqlStr)
    {
        OpenDataBase();
        cmd = new SqlCommand(SqlStr, con);
        cmd.ExecuteNonQuery();
        CloseDataBase();
    }
    /// <summary>
    /// 返回查询结果的首行首列
    /// </summary>
    /// <param name="SqlStr">查询字符串</param>
    /// <returns>返回结果</returns>
    public string ReturnSql(string SqlStr)
    {
        OpenDataBase();
        string ReturnSql = "";
        try
        {
            cmd = new SqlCommand(SqlStr, con);
            ReturnSql = cmd.ExecuteScalar().ToString();
        }
        catch { }
        CloseDataBase();
        return ReturnSql;
    }
    public static int ExecuteNonQuery(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
    {

        SqlCommand cmd = new SqlCommand();

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            return val;
        }
    }

    public static int ExecuteNonQuery(SqlConnection connection, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
    {

        SqlCommand cmd = new SqlCommand();

        PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
        int val = cmd.ExecuteNonQuery();
        cmd.Parameters.Clear();
        return val;
    }

    public static int ExecuteNonQuery(SqlTransaction trans, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
    {
        SqlCommand cmd = new SqlCommand();
        PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, commandParameters);
        int val = cmd.ExecuteNonQuery();
        cmd.Parameters.Clear();
        return val;
    }

    public static SqlDataReader ExecuteReader(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
    {

        SqlCommand cmd = new SqlCommand();
        SqlConnection conn = new SqlConnection(connectionString);

        try
        {
            PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            cmd.Parameters.Clear();
            return rdr;
        }
        catch
        {
            conn.Close();
            conn.Dispose();
            throw;
        }
    }

    public static object ExecuteScalar(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
    {
        SqlCommand cmd = new SqlCommand();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
            object val = cmd.ExecuteScalar();
            cmd.Parameters.Clear();
            return val;
        }
    }

    public static object ExecuteScalar(SqlConnection connection, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
    {

        SqlCommand cmd = new SqlCommand();

        PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
        object val = cmd.ExecuteScalar();
        cmd.Parameters.Clear();
        return val;
    }

    public static void CacheParameters(string cacheKey, params SqlParameter[] commandParameters)
    {
        parmCache[cacheKey] = commandParameters;
    }

    public static DataTable GetTable(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
        }
        return dt;
    }

    public static SqlParameter[] GetCachedParameters(string cacheKey)
    {
        SqlParameter[] cachedParms = (SqlParameter[])parmCache[cacheKey];

        if (cachedParms == null)
            return null;

        SqlParameter[] clonedParms = new SqlParameter[cachedParms.Length];

        for (int i = 0, j = cachedParms.Length; i < j; i++)
            clonedParms[i] = (SqlParameter)((ICloneable)cachedParms[i]).Clone();

        return clonedParms;
    }

    private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, CommandType cmdType, string cmdText, SqlParameter[] cmdParms)
    {

        if (conn.State != ConnectionState.Open)
            conn.Open();

        cmd.Connection = conn;
        cmd.CommandText = cmdText;

        if (trans != null)
            cmd.Transaction = trans;

        cmd.CommandType = cmdType;

        if (cmdParms != null)
        {
            foreach (SqlParameter parm in cmdParms)
                cmd.Parameters.Add(parm);
        }
    }

}
