import com.library.service.SetupVerifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        SetupVerifier verifier = (SetupVerifier) context.getBean("setupVerifier");
        verifier.verify();  
    }
}
