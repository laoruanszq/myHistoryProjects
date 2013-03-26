using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OracleClient;

/// <summary>
///DBConn 的摘要说明
/// </summary>
public class DBConn
{
    private static readonly string strConn = "Data Source=YiYuanGou;User ID=SZQ;Password=123";
    static string errorMessage;

    public static string ErrorMessage
    {
        get { return DBConn.errorMessage; }
        set { DBConn.errorMessage = value; }
    } 
	public DBConn()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 执行增删改语句
    /// </summary>
    /// <returns>返回影响行数</returns>
    public static int ExecuteUpdate(string sqlstr)
    { 
         
         OracleConnection conn = new OracleConnection(strConn); // ---实例化连接
         OracleCommand cmd = conn.CreateCommand();
         int flag = 0;

         try
         {
             conn.Open();
            
             cmd.CommandText = sqlstr;//在这儿写sql语句
             flag = cmd.ExecuteNonQuery();
         }
         catch (Exception ee)
         {
             errorMessage = ee.Message; //如果有错误，输出错误信息
         }
         finally
         {
             conn.Close(); //关闭连接
         }
         return flag;
    }

    /// <summary>
    /// 执行查询
    /// </summary>
    /// <param name="sqlstr"></param>
    /// <returns>返回datareader</returns>
    public static OracleDataReader ExecuteReader(string sqlstr)
    {
        //Create the command and connection
        OracleConnection conn = new OracleConnection(strConn);
        OracleCommand cmd = new OracleCommand(sqlstr,conn);
        OracleDataReader rdr = null;
        try
        {
            //Prepare the command to execute
            conn.Open();
            //Execute the query, stating that the connection should close when the resulting datareader has been read
            rdr = cmd.ExecuteReader();
            //cmd.Parameters.Clear();
        }
        catch (Exception ee)
        {
            errorMessage = ee.Message; //如果有错误，输出错误信息
        }
        finally
        {
            //conn.Close(); //关闭连接
        }
        return rdr;
    }

    /// <summary>
    /// 执行查询
    /// </summary>
    /// <param name="sqlstr"></param>
    /// <returns>返回datatable</returns>
    public static DataTable ExecuteAdapter(string sqlstr)
    {
        OracleConnection conn = new OracleConnection(strConn);
        OracleCommand cmd = new OracleCommand(sqlstr,conn);
        OracleDataAdapter oda = new OracleDataAdapter(cmd);
        DataTable dt = new DataTable();
        try
        {
            //Prepare the command to execute
            conn.Open();
            //Execute the query, stating that the connection should close when the resulting datareader has been read
            oda.Fill(dt);
            //cmd.Parameters.Clear();
        }
        catch (Exception ee)
        {
            errorMessage = ee.Message; //如果有错误，输出错误信息
        }
        finally
        {
            conn.Close(); //关闭连接
        }
        return dt;
    }
   /*public static string ExecuteProcedure(string pname, string sqlstr, IDataParameter[] parameters)
    {
        OracleConnection conn = new OracleConnection(strConn);
        OracleCommand cmd = new OracleCommand(sqlstr, conn);
        cmd.Connection = conn;
        cmd.CommandText = pname;
        cmd.CommandType = CommandType.StoredProcedure;
        // 创建参数 

        IDataParameter[] parameters = { 
 
                  new SqlParameter("@Id", SqlDbType.Int,4) , 
 
                  new SqlParameter("@CategoryName", SqlDbType.NVarChar,15) , 
 
              };

         // 设置参数类型 

         parameters[0].Direction = ParameterDirection.Output;  // 设置为输出参数 

         parameters[1].Value = "testCategoryName";

        // 添加参数 

        cmd.Parameters.Add(parameters[0]);

        cmd.Parameters.Add(parameters[1]);



        conn.Open();

        // 执行存储过程并返回影响的行数 

        Label1.Text = cmd.ExecuteNonQuery().ToString();

        conn.Close();

        // 显示影响的行数和输出参数 

        Label1.Text += "-" + parameters[0].Value.ToString();

 
    }*/
    

}