package enums;

public enum Permission {
    NONMEMBER(1), MEMBER(2), ADMIN(10);

    int level;
    private Permission(int level) {
        this.level = level;
    }

    public int getLevel() { return this.level; }
}