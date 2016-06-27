Compiled from "TestBranching.java"
class TestBranching {
  TestBranching();
    Code:
       0: aload_0       
       1: invokespecial #1                  // Method java/lang/Object."<init>":()V
       4: return        

  public static void main(java.lang.String[]);
    Code:
       0: ldc2_w        #2                  // double 3.0d
       3: dstore_1      
       4: iconst_0      
       5: istore_3      
       6: dload_1       
       7: ldc2_w        #4                  // double 2.0d
      10: dcmpl         
      11: ifle          19
      14: iconst_0      
      15: istore_3      
      16: goto          21
      19: iconst_1      
      20: istore_3      
      21: return        
}
