import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class HelloTest {
    @Test
    public void testAdd() {
        assertEquals(5, Hello.add(2, 3));
    }
}
