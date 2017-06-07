public class Weapon {

  private String _name;
  private String _type; //types are Sword, Axe, Lance, Tome, Bow
  private int _hit; //hit rate of the weapon
  private int _might;
  private int _durability;

  Weapon( String name, String type, int hit, int might, int durability) {
    _name = name;
    _type = type;
    _hit = hit;
    _might = might;
    _durability = durability;
  }

  public String getName() {
    return _name;
  }
  
  public String getType() {
    return _type;
  }

  public int getHit(){
    return _hit;
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
    return _durability;
  }
}