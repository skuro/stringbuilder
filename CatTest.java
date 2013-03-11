import java.io.PrintWriter;
import java.io.File;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class CatTest {

  private static PrintWriter getWriter(String testCase) throws IOException {
    String cwd = System.getProperty("user.dir");
    String file = String.format("%s/%s.log", cwd, testCase);
    new File(file).delete(); // remove if exists
    return new PrintWriter(
                 new BufferedWriter(
                       new FileWriter(file, true)));
  }

  private static ACat getCat(String testCase){
    if("catplus".equals(testCase)){
      return new CatPlus();
    } else if ("catsb".equals(testCase)) {
      return new CatSB();
    } else return new CatSB2();
  }

  public static void main(String[] args){
    String testCase = args[0];
    PrintWriter out = null;
    System.out.println(String.format("Testing %s", testCase));
    try {
      out = getWriter(testCase);
      ACat cat = getCat(testCase);
      for(int i = 0; i < 100; i++) {
        System.out.println(String.format("round %s", i));
        long result = cat.test(1000);
        out.println(result);
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (out != null) out.close();
    }
  }

}
