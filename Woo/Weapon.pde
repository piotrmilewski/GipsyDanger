public class Weapon {

  private String _name;
  private int _might;
  private int _durability;

  Weapon( String name, int might, int durability) {
    _name = name;
    _might = might;
    _durability = durability;
  }

  public String getName() {
    return _name;
  }

  public int getMight() {
    return _might;
  }

  public int getDurability() {
    return _durability;
  }

  public int setDurability( int newDur) {
    int oldDur = _durability;
    _durability = newDur;
    return oldDur;
  }

  public int takeDamage() {
    _durability--;
  }
}