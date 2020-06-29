/**
 *
 * @author José Enrique Zempoaltecatl Moyotl
 */
public class Excepciones {

    public static void main(String[] args) {

        int numerador = 20;
        Integer denominador = 2;
        float division;

        System.out.println("Antes de la división...");

        try {

            division = numerador / denominador;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            division = 0;
        }

        System.out.println(division);

        System.out.println("Despúes de la división...");

    }

}
