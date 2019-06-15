# libide implementation

## API

### IDE operations desired

1. Provide completions at the given position
2. Go to definition
3. Go to implementation
4. Find usages
5. Go to package/module/class/method/function/etc
6. Go to symbol
7. Syntax highlighting
8. Linting
9. Embedded mode (like razor templates)

### C API

*NOTE:* seems like a file abstraction is required.

*TODO:* think about concurrent parsing and async IO.

*TODO:* figure out error handling approach.

```c
/**
 * Represents IDE instance.
 */
typedef struct ide ide_t;

/**
 * Represents IDE configuration settings.
 */
typedef struct {
    // TODO: ?
    // TODO: how to pass language specific settings?
} ide_conf_t;

/**
 * Represents an open IDE file (translation unit).
 */
typedef struct ide_file ide_file_t;

```

## Project structure
