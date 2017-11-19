-----------------------------------------------------------------------------------------
  - How to use llvmcpy ???
  - Recovering stack variables Vs recovering their types
  - How klee responds
  - Use case for pointer analysis
  - Read SecondWrite Group papers
  - llvm-dev SROA on struct
  - collect summary of our meeting
  - run exp on spec2006

  - how globals are used in existing branch - Done
  - Check for pointer cases with `**argv` - Done
    - recovered as `alloca i64` just like other allocas
  - Se if global variable types are restored (like for stack varibales) -No
  - Check different examples of stack recovery by extracting the exact types: Done

-----------------------------------------------------------------------------------------
  - Why ida not working standalone in my machine- vpn
  - How to save config of irssi - done
  - using tmux with irssi = - done
  - Class hierarchy of NativeStackVar
  ```
  class NativeVar {
    protected:
    int64_t             size;
    std::string         name;
    std::string         type; // TODO: something cleverer than string. for now it's just ida_type wholesale.
    std::list<uint64_t>  refs;
    llvm::Instruction    *llvm_var;
    llvm::MCInstPrinter *MyPrinter;
    public:
    NativeVar(uint64_t size, std::string name, std::string type, llvm::MCInstPrinter *printer) : size(size), name(name), type(type), MyPrinter(printer) {
      llvm_var = nullptr;
    }
    uint64_t get_size(void) { return this->size; }
    void add_ref(uint64_t ea) { this->refs.push_back(ea); }
    std::list<uint64_t> &get_refs(void) { return this->refs; }
    llvm::Instruction *get_llvm_var(void) { return this->llvm_var; }
    void set_llvm_var(llvm::Instruction *v) { this->llvm_var = v; }
    std::string print_var(void);
    std::string get_name(void) { return this->name; }
    std::string get_type(void) { return this->type; }
    llvm::MCInstPrinter *get_printer(void) { return this->MyPrinter; }

  } ;


  class NativeStackVar : public NativeVar {
    private:
    uint64_t            offset;
    public:
    NativeStackVar(uint64_t size, std::string name, std::string type, llvm::MCInstPrinter *printer, uint64_t offset) : NativeVar(size, name, type, printer) { this->offset = offset; }
    uint64_t get_offset(void) { return this->offset; }
  };

  class Inst {
    NativeVar mem_var;
    get/set mem_var
  }

  Value *MEM_AS_DATA_REF(BasicBlock *B, 
        NativeModulePtr natM, 
        const MCInst &inst, 
        InstPtr ip,
        uint32_t which)
{
    if(false == ip->has_mem_reference) {
        throw TErr(__LINE__, __FILE__, "Want to use MEM as data ref but have no MEM reference");
    }
    if(ip->has_mem_var) {
      return ip->get_mem_var()->get_llvm_var();
    }

    return getAddrFromExpr(B, natM, inst, ip, which);
}


  ```

### April 26
  -  When driver are preset we need to include State.h which has alignas a c++11 feature. So we need to add clang++ -std=c+11; But adding clang++ will mangle the names of external function in the  driver code; so those need to e wrapped arounf in extern C

### April 20
  - Second write shape analysis
  - How assenbly to IR works in McSema
  - How is remil different than mcsema
  - how mcsema (generating funtional ir) hanldes indirect call
  - ambiguous statement in revgen
  - Is there exsit a tool to convert byte to x86 instructions : llvm-mc --disassemble
  - How ida extracts the CFG?? Same as Revgen??
  - How Revgen works
    - RevGen takes as input an x86 binary and outputs an equivalent LLVM module
    in three steps. First, RevGen looks for all executable blocks of code and
    converts them to LLVM translation blocks. Second, when there are no more
    translation blocks to cover, RevGen transforms them into basic blocks and
    rebuilds the control flow graph of the original binary in LLVM format.
    Third, RevGen resolves external function calls to build the final LLVM
    module. For dynamic analysis, a last step links the LLVM module with a
    run-time library that allows the execution of the LLVM module.

  - typing registers is possible as in lifteed LLVM IR is in SSA  
  - How to infer pointer  
  - Does IDA gives info tha a variable of a pointer?: IDA does not have that info
  ```
  // Taking the address
  var = ptr dword -8
  lea rdx, [rbp + var]

  to 

  %30 = add i64 %RBP_val.6, -8, !mcsema_real_eip !7
  %31 = inttoptr i64 %30 to i64*, !mcsema_real_eip !7  // Why is this introduced
  %32 = ptrtoint i64* %31 to i64, !mcsema_real_eip !7
  store i64 %32, i64* %XDX, !mcsema_real_eip !7

  Instead of

  var  = alloca i64*

  %32 = ptrtoint i64* %var to i64
  store i64 %32, i64* %XDX


  Pointers access are just like normal stack variables accesses
  ```

  - How to extract struct info from IDA? Done
  - Are these info available from dwarf debug? Yes
  - What is referent and referee in the contect of variable recovery: Done
  - Why out is suddenly started printed in hex: 
  ```
   cout << std::hex // This modifies the format   string for the rest of the code
  ```
  - 

### Mar 26
 - bitcast : zeroing out MSB 32 bits which stoting LSB 32 in 64 bit data: 
  ```` 
  rip i64* 
  eip_read: i64* to i32*
  eip_write: i64* to i64*
  ```
 - Is master mcsema creating proper exec: Use libnone
 - Examing read write and variable creation
 - Master does not have satck recevery even though the cfg is correctly populated wit the info
  - mcsema_stack_public_master_merge/mc-sema/peToCFG/peToCFG.cpp === mcsema_latest_stack_public_master_merge/mcsema/CFG/CFG.cpp
  - in function, deserializeFunction we can find the stack varible incorporation while its missing at DeserializeNativeFunc


### Mar 22
  - idc.FUNC_FRAME: in which senarios this could be not set
  ```
    _uses_bp = 0 != (idc.GetFunctionFlags(f) & idc.FUNC_FRAME)
    frame = idc.GetFrame(f)
    if frame is None:
        return stackArgs
  ```
  - 
  ```
  db : 8
  dw : 16
  dd :  32
  dq : 64
  ```

### Mar 1
  - Read Papers
  - What is --no-strcit-aliasing
  - decompilation using debug info

### Feb 26
  -   How frame pointer can be eliminated: No need to do push rbp and move rsp-\>rbp. Do all the local variable access using rsp instead.
  ```
    gcc -S  -fomit-frame-pointer *.c  -o *.s

  ```
  -   Read jump table particular w.r.t the paper Binary decompilation is not easy 

### Feb 22
  - Search conferences

### Feb 19
  - Retrive the gdb command to go through the machine level code
  - /home/sdasgup3/Github/mcsema_new_reg_assign/build/ <==> /home/sdasgup3/Github/binary-decompilation
  - why test_15 is faling?
  - stack variable branch of mcsema ?? 
  - Allexe getting segfault
  - Ask about val tests
  - Ask about stack public master merge
  - advances in fcd??
  - Whats wrong with the output of stack var branch of mcsema; why the cfg not created

### Nov 14
  - Learn IDC: enhance knowledge  of disaas
  - Understanding elf
  - Test the pooibilty of type based variable promotion
  - Mcsema Translation; MC layer
  - what is the .cfg (DONE)
  - inline assembly (DONE)
  - stack variable deduction in IDA
  - how to generate inline ass

    Learning
      - RDI, RSI, RDX, RCX (R10 in the Linux kernel interface[17]:124), R8, and R9

#### Oct 22 2016
  - Undo register coloring optimization where the variable of sdifferent types and disjoing lifetimes are merge into same variable.
  - mem2reg + dce

#### Oct 20 2016
  - Building latest mcsema
    - Ubuntu: bin\_descend  passes but cfg\_2\_bc fails. Reported on github issues 
    - Presto: To have the same build status as Jenkins, I have to copy val.so
    - Commando ??
    - Alias Analysis
  ```
  opt -basicaa -aa-eval -print-alias-sets  pa3.ll -disable-output
  opt -basicaa -aa-eval -print-all-alias-modref-info  pa3.ll -disable-output
  opt -memdep -print-memdeps -gvn -analyze test_2.ll
  ```

