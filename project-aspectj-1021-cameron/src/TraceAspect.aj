

public aspect TraceAspect {
   pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);

   pointcut methodToTrace():  classToTrace() &&  execution(* *(..));


   before(): methodToTrace() {
      System.out.println("\t-->" + thisJoinPointStaticPart.getSignature() + //
      
            ", " + thisJoinPointStaticPart.getSourceLocation().getLine());
   }

   after(): methodToTrace() {
      System.out.println("\t<--" + thisJoinPointStaticPart.getSourceLocation());
   }
}
