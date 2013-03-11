public class CatPlus extends ACat {
  @Override
  protected String cat(String base, String append){
    String result = "const1" + base;
    result = result + "const2";

    return result + append;
  }
}
