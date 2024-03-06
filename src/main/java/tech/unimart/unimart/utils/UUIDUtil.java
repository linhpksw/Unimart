package tech.unimart.unimart.utils;

import java.util.UUID;

public class UUIDUtil {
    public static String generateRandomUUID(int length) {
        return UUID.randomUUID().toString().replace("-", "").substring(0, length);
    }
}
