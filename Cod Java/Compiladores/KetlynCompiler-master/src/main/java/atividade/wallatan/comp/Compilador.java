package atividade.wallatan.comp;

import atividade.wallatan.comp.analyzers.assembly.AssemblyMaker;
import atividade.wallatan.comp.analyzers.intermediary.Intermediary;
import atividade.wallatan.comp.analyzers.lexical.LexicalAnalyzer;
import atividade.wallatan.comp.analyzers.semantic.SemanticAnalyzer;
import atividade.wallatan.comp.analyzers.syntactic.SyntacticAnalyzer;
import atividade.wallatan.comp.util.ArgumentParser;
import atividade.wallatan.comp.util.FileManager;

public class Compilador {
    public static void main(String[] args) {
        var argumentParser = new ArgumentParser(args);

        argumentParser.parse();
        var fileManager = new FileManager(argumentParser.getFilePath());
        var sourceCode = fileManager.read();
        
        //Análize Léxica
        var lexicalAnalyzer = new LexicalAnalyzer(sourceCode);
        lexicalAnalyzer.analyze();
        var tokens = lexicalAnalyzer.getTokens();
        
        //System.out.println(tokens);
        var syntacticAnalyzer = new SyntacticAnalyzer(tokens);
        syntacticAnalyzer.analyze();
        var semanticAnalyzer = new SemanticAnalyzer(tokens);
        semanticAnalyzer.analyze();
        var intermediary = new Intermediary(tokens,semanticAnalyzer.getVariables().keySet());
        final var intermediaryCode = intermediary.generate();
        var assemblyMaker = new AssemblyMaker();
        final var assembly = assemblyMaker.codFinal(intermediaryCode);
        fileManager.writeDataOnAsmFile(assembly);
    }
}
