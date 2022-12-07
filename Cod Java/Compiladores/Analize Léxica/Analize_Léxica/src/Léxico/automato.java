package Léxico;
public class automato {
    static int q1(String cod, int pont, String buff, int start) { //int e if
        pont++;
        int cont = 1;
        int vari=0;
        char Character = cod.charAt(pont);

        if (Character == 'n'){
            pont++; cont++;
            Character = cod.charAt(pont);
            
            if (Character == 't'){ //int
                pont++; cont ++;
                Character = cod.charAt(pont);

                //Verifica se é um id
                if (Character == ' '){                    
                    operandos.print(cod, pont, start, cont);
                    return pont;
                }
                
                vari=1;
                pont = operandos.valida(cod, pont, buff, start, cont, vari);
                return pont;
            }
            
            pont = operandos.valida(cod, pont, buff, start, cont, vari);
            return pont;

        } 

        if (Character == 'f'){ //if
            pont++; cont ++;
            Character = cod.charAt(pont);

            if (Character == ' '){
                operandos.print(cod, pont, start, cont);
                return pont;
            }
            
            vari=1;
            pont = operandos.valida(cod, pont, buff, start, cont, vari);
            return pont;

        }
    
        pont = operandos.valida(cod, pont, buff, start, cont, vari);
        return pont;
        
    }

    static int q2(String cod, int pont, String buff, int start) { //end e else
        pont++;
        int cont = 1;
        int vari=0;
        char Character = cod.charAt(pont);

        if (Character == 'n'){
            pont++; cont++;
            Character = cod.charAt(pont);
            
            if (Character == 'd'){ 
                pont++;
                Character = cod.charAt(pont);
                
                if (Character == ' '){
                    operandos.print(cod, pont, start, cont);
                    return pont;
                }
                
                vari=1;
                pont = operandos.valida(cod, pont, buff, start, cont, vari);
                return pont;

            }
            
            pont = operandos.valida(cod, pont, buff, start, cont, vari);
            return pont;
        } 
        
        if (Character == 'l'){
            pont++; cont++;
            Character = cod.charAt(pont);
            
            if (Character == 's'){
                pont++; cont++;
                Character = cod.charAt(pont);

                if (Character == 'e'){
                    pont++;cont++;
                    Character = cod.charAt(pont);
                    
                    //Verifica se é um id
                    if (Character == ' '){
                        operandos.print(cod, pont, start, cont);
                        return pont;
                    }
                    
                    vari=1;
                    pont = operandos.valida(cod, pont, buff, start, cont, vari);
                    return pont;
                 }
              
                pont = operandos.valida(cod, pont, buff, start, cont, vari);
                return pont; 

            } 

            pont = operandos.valida(cod, pont, buff, start, cont, vari);
            return pont; 

        }   
        
        pont = operandos.valida(cod, pont, buff, start, cont, vari);
        return pont;

    }

    static int q3(String cod, int pont, String buff, int start) { //begin
        pont++; int cont = 1;
        int vari=0;
        char Character = cod.charAt(pont);
       
        if (Character == 'e'){
            pont++; cont++;
           
            if (Character == 'g'){ 
                pont++; cont++;
                Character = cod.charAt(pont);
                
                if (Character == 'i'){ 
                    
                    pont++; cont++;
                    Character = cod.charAt(pont);

                    if (Character == 'n'){ 
                        pont++; cont++;
                        Character = cod.charAt(pont);
                        
                        if (Character == ' '){
                            operandos.print(cod, pont, start, cont);
                            return pont;
                        }
                        
                        vari=1;
                        pont = operandos.valida(cod, pont, buff, start, cont, vari);
                        return pont; 

                    }

                    pont = operandos.valida(cod, pont, buff, start, cont, vari);
                    return pont;  

                }
                
                pont = operandos.valida(cod, pont, buff, start, cont, vari);
                return pont;     

            } 
            
            pont = operandos.valida(cod, pont, buff, start, cont, vari);
            return pont; 
        }
        
        pont = operandos.valida(cod, pont, buff, start, cont, vari);
        return pont; 
    }
    
    static int q4(String cod, int pont, String buff, int start) { //then
        pont++; int cont =1;int vari=0;
        char Character = cod.charAt(pont);
        
        if (Character == 'h'){
            pont++; cont++;
            Character = cod.charAt(pont);
            
            if (Character == 'e'){ 
                pont++; cont++;
                Character = cod.charAt(pont);
               
                if (Character == 'n'){ 
                    pont++; cont++;
                    Character = cod.charAt(pont);
                
                    if (Character == ' '){
                        operandos.print(cod, pont, start, cont);
                        return pont;
                    }
                    
                    vari=1;
                    pont = operandos.valida(cod, pont, buff, start, cont, vari);
                    return pont;    

                } 
                
                pont = operandos.valida(cod, pont, buff, start, cont, vari);
                return pont;  

            } 
            
            pont = operandos.valida(cod, pont, buff, start, cont, vari);
            return pont;

        }
        
        pont = operandos.valida(cod, pont, buff, start, cont, vari);
        return pont;
    }

    static int q5(String cod, int pont, String buff, int start) { //Whi || Write
        pont++; int cont =1;int vari=0;
        char Character = cod.charAt(pont);
        
        if (Character == 'r'){
            pont++; cont++;
            Character = cod.charAt(pont);
            
            if (Character == 'i'){ 
                pont++; cont++;
                Character = cod.charAt(pont);
                
                if (Character == 't'){ 
                    pont++; cont++;
                    Character = cod.charAt(pont);
                    
                    if (Character == 'e'){ 
                        pont++; cont++;
                        Character = cod.charAt(pont);
                        
                        if (Character == ' '){
                            operandos.print(cod, pont, start, cont);
                            return pont;
                        }
                        
                        vari=1;
                        pont = operandos.valida(cod, pont, buff, start, cont, vari);
                        return pont;

                    }
                     
                    pont = operandos.valida(cod, pont, buff, start, cont, vari);
                    return pont;

                }
               
                pont = operandos.valida(cod, pont, buff, start, cont, vari);
                return pont;
                   
            }
            
            pont = operandos.valida(cod, pont, buff, start, cont, vari);
            return pont;

        }     
        
        if (Character == 'h'){
            pont++; cont++;
            Character = cod.charAt(pont);
            
            if (Character == 'i'){ 
                pont++;cont++;
                Character = cod.charAt(pont);
            
                if (Character == ' '){
                    operandos.print(cod, pont, start, cont);
                    return pont;
                }
                
                vari=1;
                pont = operandos.valida(cod, pont, buff, start, cont, vari);
                return pont;                  

            }
                
            pont = operandos.valida(cod, pont, buff, start, cont, vari);
            return pont;
        }
        
        pont = operandos.valida(cod, pont, buff, start, cont, vari);
        return pont;
    }

    static int q6(String cod, int pont, String buff, int start) { //do
        pont++; int cont=1;int vari=0;
        char Character = cod.charAt(pont);
        
        if (Character == 'o'){
            pont++;cont++;
            Character = cod.charAt(pont);
            
            if (Character == ' '){
                operandos.print(cod, pont, start, cont);
                return pont;
            }
            
            pont = operandos.valida(cod, pont, buff, start, cont, vari);
            return pont;
        }
        
        pont = operandos.valida(cod, pont, buff, start, cont, vari);
        return pont;
    }

    static int q7(String cod, int pont, String buff, int start) { //for
        pont++; int cont=1;int vari=0;
        char Character = cod.charAt(pont);
        
        if (Character == 'o'){
            pont++; cont++;
            Character = cod.charAt(pont);
            
            if (Character == 'r'){ 
                pont++; cont++;
                Character = cod.charAt(pont);
                
                if (Character == ' '){
                    operandos.print(cod, pont, start, cont);
                    return pont;
                }
                
                vari=1;
                pont = operandos.valida(cod, pont, buff, start, cont, vari);
                return pont;

            }

            pont = operandos.valida(cod, pont, buff, start, cont, vari);
            return pont;

        } 
        
        pont = operandos.valida(cod, pont, buff, start, cont, vari);
        return pont;
    }
    
    static int q8(String cod, int pont, String buff, int start) {  //read
        pont++; int cont = 1;int vari=0;
        char Character = cod.charAt(pont);
       
        if (Character == 'e'){
            pont++;cont++;
            Character = cod.charAt(pont);
            
            if (Character == 'a'){ 
                pont++;cont++;
                Character = cod.charAt(pont);
                
                if (Character == 'd'){ 
                    pont++;cont++;
                    Character = cod.charAt(pont);
                    
                    if (Character == ' '){
                        operandos.print(cod, pont, start, cont);
                        return pont;
                    }
                    
                    vari=1;
                    pont = operandos.valida(cod, pont, buff, start, cont, vari);
                    return pont;

                }
                
                pont = operandos.valida(cod, pont, buff, start, cont, vari);
                return pont;     

            }
            
            pont = operandos.valida(cod, pont, buff, start, cont, vari);
            return pont;

        }
        
        pont = operandos.valida(cod, pont, buff, start, cont, vari);
        return pont;
    }

}
