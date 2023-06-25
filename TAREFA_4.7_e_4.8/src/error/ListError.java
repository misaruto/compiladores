package error;
import java.util.List;
import java.util.ArrayList;

public class ListError {
  public List<Error> lsError;

  public ListError(){
    this.lsError = new ArrayList<Error>();
  }

  public void defineError(int line,int column,String message){
    lsError.add(new Error(line,column,message));
  }
  public void defineError(int line, int column){
    lsError.add(new Error(line,column));
  }
  public void defineError(String message){
    if(this.hasError()){
      lsError.stream().forEach((error) -> {
      if(error.getMessage() == null){
        error.setMessage(message);
      }
        
    });
    }
    else{
      lsError.add(new Error(message));
    }
  }
  public boolean hasError(){
    return lsError.size() > 0;
  }
  public void dump(){
    lsError.stream().forEach((error) -> {
      error.showError();
    });
  }
}