public record TokenMetadata(
        Terminal token,
        String lexeme,
        int line,
        int column
) {
}
