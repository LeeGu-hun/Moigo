package exception;

public class AlreadyExistingUserException extends RuntimeException{
	public AlreadyExistingUserException(String message){
		super(message);
	}
}
