package atividade.wallatan.comp.analyzers;

import atividade.wallatan.comp.grammar.Terminal;

public record TokenMetadata(
        Terminal token,
        String lexeme,
        int line,
        int column
) {
}
