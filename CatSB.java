public class CatSB extends ACat {
  @Override
  protected String cat(String base, String append){
    return new StringBuilder()
                  .append("const1")
                  .append(base)
                  .append("const2")
                  .append(append)
                  .toString();
  }
}
