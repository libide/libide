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


### Symbols table

A table representing symbols should be itroduced. The follwing operations
should be supported (preferrable time is O(1)):

1. Get symbols of certain type.
2. Get symbols of any type.
3. Check whether a symbol exitsts.

### C API

*NOTE:* seems like a file abstraction is required.

*TODO:* think about concurrent parsing and async IO.

*TODO:* figure out error handling approach.

TSNode stores only positions in the source file not the text itself so we need
a function like

```c
const char* getstr(void* file, TSPoint from, TSPoint to);
```

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

Symbols table

```c
// Represents a global symbols table for a project.
typedef struct {
    // ???
} ide_index_t;

typedef struct {
    const char*   mask; // file mask
    const char*   sym;  // symbola name;
    ide_symtype_t type; // symbol type;
} ide_search_t;

ide_index_find()

```


## Project structure




















