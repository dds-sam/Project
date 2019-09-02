package cn.dds.utils;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

//自定义类型转换器
public class TimeConverter extends BaseTypeHandler<String> {
    //将Java中的String类型的日期字符串转换成数据库中的datetime类型
    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, String datetime, JdbcType jdbcType) throws SQLException {
        SimpleDateFormat dataformat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        try {
            Date time = dataformat.parse(datetime);
          //  preparedStatement.setDate(i,time);

        } catch (ParseException e) {
            e.printStackTrace();
        }

    }

    @Override
    public String getNullableResult(ResultSet resultSet, String s) throws SQLException {
        return null;
    }

    @Override
    public String getNullableResult(ResultSet resultSet, int i) throws SQLException {
        return null;
    }

    @Override
    public String getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        return null;
    }
}
