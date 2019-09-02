package cn.dds.utils;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

@Component
public class RedisUtilsImpl implements RedisUtils {
    @Resource
    private RedisTemplate redisTemplate;
    /**
     * 将数据以key-value键值对的形式存入redis，并设置时间(单位分钟)
     * @param key
     * @param value
     * @param expireTime
     */
    @Override
    @SuppressWarnings("unchecked")
    public void insert(String key, String value, int expireTime) {
        redisTemplate.opsForValue().set(key,value);
        redisTemplate.expire(key,expireTime,TimeUnit.MINUTES);
    }
    /**
     * 根据key删除对应的数据
     * @param key
     */
    @Override
    @SuppressWarnings("unchecked")
    public void delete(String key) {
      redisTemplate.delete(key);
    }
    /**
     * 根据key获取对应的数据
     * @param key
     * @return
     */
    @Override
    @SuppressWarnings("unchecked")
    public String getValue(String key) {
        return (String) redisTemplate.opsForValue().get(key);
    }
}
