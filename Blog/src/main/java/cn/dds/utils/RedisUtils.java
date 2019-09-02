package cn.dds.utils;

public interface RedisUtils {
    /**
     * 将数据以key-value键值对的形式存入redis，并设置时间(单位分钟)
     * @param key
     * @param value
     * @param expireTime
     */
    void insert(String key,String value,int expireTime);

    /**
     * 根据key删除对应的数据
     * @param key
     */
    void delete(String key);

    /**
     * 根据key获取对应的数据
     * @param key
     * @return
     */
    String getValue(String key);

}
