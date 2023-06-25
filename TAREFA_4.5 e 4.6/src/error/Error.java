package error;

class Error {
  int line;
  int column;
  String message;
  public Error(){
    this.line = 0;
    this.column = 0;
    this.message = null;
  }
  public Error(int line,int column,String message){
    this.line = line;
    this.column = column;
    this.message = message;
  }
  public Error(int line,int column){
    this.line = line;
    this.column = column;
    this.message = null;
  }
  public Error(String message){
    this.message = message;
  }
  public void setMessage(String message){
    this.message = message;
  }
  public String getMessage(){
    return  this.message;
  }
  public void showError(){
    String error = "Error:: line " + this.line + ", column " + this.column;
    if(this.message != null){
      error = error + ": " + this.message;
    }
    else{
      error = error + ": Erro desconhecido";
    }
  
    System.out.println(error);
  }
}
