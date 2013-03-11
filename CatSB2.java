public class CatSB2 extends ACat {
  @Override
  protected String cat(String base, String append){
    return new StringBuilder("const1")
                  .append(base)
                  .append("const2")
                  .append(append)
                  .toString();
  }
}
