import java.util.Random;

public abstract class ACat {
  protected abstract String cat(String base, String append);

  public long test(int rounds){
    String base = "start";

    long start = System.currentTimeMillis();
    for (int i = 0; i < rounds; ++i) {
      byte[] next = new byte[10];
      new Random().nextBytes(next);
      base = cat(base, new String(next));
    }
    long end = System.currentTimeMillis();
    return end - start;
  }
}
