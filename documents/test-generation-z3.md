## Testcase generation using symbolic execution of x86-64 instructions's implementation
- Find the input value of `rbx`, `rcx` which generate `0` value for the `zf` flag on `andb` instruction.

```C
(declare-const rbx (_ BitVec 64))
(declare-const rax (_ BitVec 64))
(declare-const rcx (_ BitVec 64))


( push )
( echo "andb_r8_r8::rbx")
(assert
(= #b0

(let ((a!1 (bvor ((_ extract 31 0) ((_ sign_extend 56) ((_ extract 7 0) rbx)))
                 ((_ extract 31 0) ((_ sign_extend 56) ((_ extract 7 0) rcx))))))
(let ((a!2 (bvxor a!1
                  ((_ extract 31 0) ((_ sign_extend 56) ((_ extract 7 0) rcx)))
                  ((_ extract 31 0) ((_ sign_extend 56) ((_ extract 7 0) rbx))))))
  (ite (= a!2 #x00000000) #b1 #b0)))

))

(check-sat)
(get-model)
( pop )
```
- instruction level test-case generation may not be used to generate program level high coverage test-cases.

First consider the case of straight-line code
```C
subroutine(int x):
1.  x = a % 2; // outputs are 0-1
2.  y = x % 5 // output are 0-4
3. return y
```
Instruction-level symEx for 2 might give us (input 8, output 3), but instruction 1 cannot generate 8 as its output and hence its impossible to get an input of the program which  generates as output 3.

Next, consider the case with branches
```C
subroutine(int x):
1.  if x > 0 then
2.   y = getsign(x)
3.  else
4.   y  = getsign(x)
5. return y
```
Instuction-level test-input/output for 2: (input: 2, output:0) (input: -2, output:1)
But there is no way we can get the value of x as 2 in the then part of the if statement.
