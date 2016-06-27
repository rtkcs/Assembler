Compiled from "TestSum.java"
class TestSum {
  TestSum();
    Code:
       0: aload_0       
       1: invokespecial #1                  // Method java/lang/Object."<init>":()V
       4: return        

  public static void main(java.lang.String[]);
    Code:
       0: iconst_3      
       1: istore_1      
       2: iconst_2      
       3: istore_2      
       4: iconst_0      
       5: istore_3      
       6: iload_1       
       7: iload_2       
       8: iadd          
       9: istore_3      
      10: return        
}
Compiled from "TestSum.java"
class TestSum {
  TestSum();
    Code:
       0: aload_0       
       1: invokespecial #1                  // Method java/lang/Object."<init>":()V
       4: return        

  public static void main(java.lang.String[]);
    Code:
       0: iconst_3      
       1: istore_1      
       2: iconst_2      
       3: istore_2      
       4: iconst_0      
       5: istore_3      
       6: iload_1       
       7: iload_2       
       8: iadd          
       9: istore_3      
      10: ldc2_w        #2                  // double 3.1d
      13: dstore        4
      15: ldc2_w        #4                  // double 2.0d
      18: dstore        6
      20: dload         4
      22: dload         6
      24: dadd          
      25: dstore        8
      27: return        
}
