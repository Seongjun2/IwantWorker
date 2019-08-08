package Util;

public class PreventSQLInjection {
    private static String[] problemCharacter = new String[]{"'", "\"", "`", "~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")"};
    public static boolean passOrNot(String id){
        for (String s : problemCharacter) {
            if (id.contains(s)) return false;
        }
        return true;
    }
}
