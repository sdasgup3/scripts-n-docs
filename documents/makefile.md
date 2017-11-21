### General tips
- `ret=$(shell cmd)`: Execute any shell command.
- `cat -e -t Makefile` shows the presence of tabs with ^I and line endings with $.
- `PRECIOUS: %.o` : Prevents deletion of temporary files (as determined by Makefile system).
- `make VERBOSE=1` or In cmake, set `CMAKE_VERBOSE_MAKEFILE to ON`.
- By default, `parallel make` will stop if on `make` fails. Use `make -k` to override (k: continue).

## Parallel Invoke
### On Directories
```
TESTS=$(shell find . -maxdepth 1  -type d -name "test_*" | sort -V)
.PHONY:	${TESTS}  all clean x86states kstates compare allclean cleanxstate cleankstate
SUB_TARGET=all

all: ${TESTS}

${TESTS}:
	@${MAKE} -C $@ $(MAKECMDGOALS)

all allclean xstate kstate compare cleanxstate cleankstate: ${TESTS}
```
### Within each directory on each file
```
TESTS=$(shell find . -maxdepth 1   -name "*.s" | sort -V)

OUTDIR=Output
# The following are just labels
KSTATES=$(patsubst %.s, %.kstate, $(TESTS))
XSTATES=$(patsubst %.s, %.xstate, $(TESTS))
CSTATES=$(patsubst %.s, %.cstate, $(TESTS))

Mkdir=@mkdir -p $(@D)
RUN_SH=../../scripts/run.pl


.PHONY:	${TESTS}  all allclean xstate kstate compare cleanxstate cleankstate

all:	kstate xstate compare

kstate: ${KSTATES}
xstate: ${XSTATES}
compare:${CSTATES}

%.kstate: %.s
	$(Mkdir)
	touch  ${OUTDIR}/$@


%.xstate: %.s
	touch  ${OUTDIR}/$@

%.cstate: ${OUTDIR}/%.kstate ${OUTDIR}/%.xstate
	@echo "Compare"

allclean:
	@echo "All Cleaning"

cleankstate:
	@echo "K Cleaning"
	@rm -rf ${OUTDIR}/*.kstate

cleanxstate:
	@echo "X Cleaning"
	@rm -rf ${OUTDIR}/*.xstate
```


### Makefile variables
```
target: prerequisites
    action
$@ == target
$< == first membet of prerequisites
$^ == all members of prerequisites
```

### Substitution
```
SRCS=$(shell find .  -name "*.cpp" | sort -V)
OBJS=$(patsubst %.cpp, %.o, $(SRCS))
OBJS = $(SRCS:$(A)/%.cpp=$(B)/%.o)
```
Now if we want to take some action foreach members of $(OBJS), then
```
TARGET := test
SRCS=$(shell find .  -name "*.cpp" | sort -V)
OBJS=$(patsubst %.cpp, %.o, $(SRCS))

.PHONY: all
all: $(TARGET)
test: $(OBJS)
		$(CXX)  $^  -o $@

%.o: %.cpp
		$(CXX) $(CXXFLAGS) -I $(INCLUDES) $< -c -o $@
```

### Inferring rules & recipe

- The following rule
  ```
  ITEMS: X Y Z
  all:${ITEMS}
  ${ITEMS}:
          @echo $@
  ```

  gives
  ```
  X
  Y
  Z
  ```

- In the previous example, if `all:${ITEMS}`, then the output will be `X`; that
is only the first rule is chosen. Another way to have all the recipes executed
is to do `make X Y Z`

####.PHONY target
- Avoid a conflict with a file of the same name
  With the following rules
  ```
  all : test.exe

  test.exe:
    gcc test.c
  ```

  Once `test.exe` is produced, the rule `test.exe` is not activated, because it
  does not have any prerequisites that can change and trigger the rule in turn.
  But with the following, the rule will be triggered every time.

  ```
  .PHONY: test.exe

  test.exe:
    gcc test.c
  ```

  This is useful in case of rules like `clean`, where we want the rule to get
  activated at every invocation. But as it does not have any prerequisites and so
  if there is a file named `clean` in directory, then the rule will not
  activated.

- Improve performance
  Often we need rules for recursive `make`s like

  ```
  .PHONY:all
  TESTS=$(shell find . -type d -name "test_*" | sort -V)

  all:
    @for test in ${TESTS}; do \
      make -C $${test} ; \
    done
  ```
  The problem with this are:
  1. It will continue to build the rest of the directories even when one fails.
  2. Cannot leverage the parallel `make` facility as this is a single shell command.

  Also we cannot do stuff like,

  ```
    .PHONY:all
    TESTS=$(shell find . -type d -name "test_*" | sort -V)

    all: ${TESTS}

    ${TESTS}:
        make -C $@
  ```
  Here `.PHONY:all` means whenever `make` is invoked execute the recipe which is "all the directories". But as all the directories are already there, so `nothing to make for all`
  Also the rule for `${TESTS}` does not have any prerequisites, so it will never execute.

  So, to avoid all this and to avail the facility of `parallel make` do,
  ```
  TESTS=$(shell find . -type d -name "test_*" | sort -V)
  .PHONY: all ${TESTS}

  all:  ${TESTS}
  ${TESTS}:
    make -C $@
  ```

###Debugging

  ```
  $(warning dsand $(LCC))
  @echo $(LCC)
  ```

###Canceling implicit rules
  You can override a built-in implicit rule (or one
    you have defined yourself) by defining a new pattern rule with the same
target and prerequisites, but a different recipe. When the new rule is defined,
       the built-in one is replaced. The new rule’s position in the sequence of
       implicit rules is determined by where you write the new rule.  You can
       cancel a built-in implicit rule by defining a pattern rule with the same
       target and prerequisites, but no recipe.

       For example, `%.o : %.s` would cancel the rule that runs the assembler.
