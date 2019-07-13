# Compiler Techniques and tools

## Compilers
#### LLVM
 - Backend
  - https://github.com/draperlaboratory/fracture/wiki
  - [Life of an instruction in LLVM by Eli](https://eli.thegreenplace.net/2012/11/24/life-of-an-instruction-in-llvm)
  - [Different LLVM IRs](https://cranelift.readthedocs.io/en/latest/compare-llvm.html#intermediate-representations)
  - [MC Project](http://blog.llvm.org/2010/04/intro-to-llvm-mc-project.html)

- Builds/Writing Passes
  - [llvm-dev-meeting-tutorial-2015](https://github.com/quarkslab/llvm-dev-meeting-tutorial-2015)
  - [clang-llvm-tutorial](https://github.com/lijiansong/clang-llvm-tutorial)
  - [Developing passes out of source](http://llvm.org/docs/CMake.html#developing-llvm-passes-out-of-source)
  - [Write LLVM Pass](http://llvm.org/docs/WritingAnLLVMPass.html)
  - [Run a LLVM pass automatically with clang](https://www.cs.cornell.edu/~asampson/blog/clangpass.html)
  - [LLVM for Grad Students](https://www.cs.cornell.edu/~asampson/blog/llvm.html)
  - [LLVM Debugging Tips and Tricks](http://bholt.org/posts/llvm-debugging.html)
  - [Analyzing function CFGs with LLVM](https://eli.thegreenplace.net/2013/09/16/analyzing-function-cfgs-with-llvm)
- Some off the shelf Analysis implementations
  - [LLVMCallGraph](https://github.com/lihebi/LLVMCallGraph/blob/master/hebicg/hebicg.cpp)
  - [LLVM-Dataflow-Examples](https://github.com/akashlevy/LLVM-Dataflow-Examples)
  - [llvm-dataflow-graphs](https://github.com/k3ut0i/llvm-dataflow-graphs)
- LLBD
  - [LLVM Debugging Tips and Tricks](http://bholt.org/posts/llvm-debugging.html)

## Debuggers
  - [Writing a Linux Debugger](https://blog.tartanllama.xyz/writing-a-linux-debugger-setup/)


### Miscellaneous Reads
  - [Tail Call Optimizations](http://web.archive.org/web/20111030134120/http://www.sidhe.org/~dan/blog/archives/000211.html)

# Program Synthesis
 - [Adrian Sampson: Program Synthesis is Possible](https://www.cs.cornell.edu/~asampson/blog/minisynth.html)
 - [A program Synthesis Primer](https://barghouthi.github.io/2017/04/24/synthesis-primer/)
 - [Program Synthesis Explained](https://homes.cs.washington.edu/~bornholt/post/synthesis-explained.html)


# Machine Learning

## Tensor-flow
  - [Install](https://www.tensorflow.org/install/pip)
  - [Tensorflow Playground](http://playground.tensorflow.org)
  - MLIR
    - [MLIR: A new intermediate representation and compiler framework](https://medium.com/tensorflow/mlir-a-new-intermediate-representation-and-compiler-framework-beba999ed18d)


## Books
  - [mlyearning](https://www.mlyearning.org/)
  - [ Neural Networks and Deep Learning](http://neuralnetworksanddeeplearning.com/index.html)
  - [Deep Learning](http://www.deeplearningbook.org/)
  - [Videos](https://www.youtube.com/channel/UC0rqucBdTuFTjJiefW5t-IQ/videos)

## Courses
  - [AI For Everyone](https://www.deeplearning.ai/ai-for-everyone/)
  - [CNN](https://www.youtube.com/playlist?list=PLkDaE6sCZn6Gl29AoE31iwdVwSG-KnDzF)
  - [Introduction to TensorFlow for Artificial Intelligence, Machine Learning, and Deep Learning _by_ deeplearning.ai and offered by Coursera. Laurence Moroney](https://www.coursera.org/learn/introduction-tensorflow/home/welcome)
    - Using TF to implement NNs, CNNs


## Videos Lectures
  - [TensorFlow](https://www.youtube.com/channel/UC0rqucBdTuFTjJiefW5t-IQ/videos)
  - MIT course [introtodeeplearning](http://introtodeeplearning.com/)
    - MIT 6.S191: Deep Reinforcement Learning
      - [Vedio]( https://www.youtube.com/watch?v=i6Mi2_QM3rA&list=WL&index=123&t=0s)
      -  [slide](http://introtodeeplearning.com/materials/2019_6S191_L5.pdf)
  - [Stanford CS230: Deep Learning | Autumn 2018](https://www.youtube.com/watch?v=PySo_6S4ZAg&list=PLoROMvodv4rOABXSygHTsbvUz4G_YQhOb)


# Z3
 - [Rise4Fun](https://rise4fun.com/Z3/tutorial/guide)
 - [SAT/SMT by Example](https://yurichev.com/writings/SAT_SMT_by_example.pdf)
 - [z3py-tutorial](https://github.com/ericpony/z3py-tutorial)
   - [Z3 API in Python](http://ericpony.github.io/z3py-tutorial/guide-examples.htm)
   - [z3 playground](https://github.com/0vercl0k/z3-playground)
   - [Python SymEx Using Z3](https://github.com/thomasjball/PyExZ3)
 - [Programming Z3](https://theory.stanford.edu/~nikolaj/programmingz3.html)

# Reverse Engineering

  - Blogs
    - [ShortJump](http://0xeb.net/)  

  - Articles  
    - [Liveness Analysis](https://reverseengineering.stackexchange.com/questions/11238/variable-liveness-analysis-on-binaries)

  - Tools  
    - IDA
      - Shortjump
        - [Using Z3 with IDA to simplify arithmetic operations in functions](http://0xeb.net/2018/03/using-z3-with-ida-to-simplify-arithmetic-operations-in-functions/)
        - [Writing a simple x86 emulator with IDAPython](http://0xeb.net/2018/02/writing-a-simple-x86-emulator-with-idapython/)
      - [IDAPython Tutorial with example script](https://www.youtube.com/watch?v=5ehI2wgcSGo)
      - [Using IdaPython to make your life easier](https://unit42.paloaltonetworks.com/tag/idapython/)
      - [List of IdaPlugins](https://github.com/onethawt/idaplugins-list)
      - [Running scripts from the command line with idascript](http://www.hexblog.com/?p=128)
      - [IDAPython Project for HexRays](https://github.com/idapython/src)
      - [IDAPython Doc](https://www.hex-rays.com/products/ida/support/idapython_docs/)
      - [IDA switches](https://www.hex-rays.com/products/ida/support/idadoc/417.shtml)
    - [LIEF - Library to Instrument Executable Formats](https://github.com/lief-project/LIEF)
    - [Powerful Disassembler Library For x86/AMD64](https://github.com/gdabah/distorm)
      - [wiki](https://github.com/gdabah/distorm/wiki)
      - [Instruction decoding](https://github.com/gdabah/distorm/wiki/x86x64MachineCode)
    - [Angr CLE](https://github.com/angr/cle)
    - [libelfin - C++11 ELF/DWARF parser](https://github.com/aclements/libelfin)  
    - [Triton - Dynamic Binary Analysis (DBA) framework](https://github.com/JonathanSalwan/Triton)
    - [pyelftools - Parsing ELF and DWARF in Python](https://github.com/eliben/pyelftools)
    - Ghidra
      - Shortjump
        - [Ghidra: A quick overview for the curious](http://0xeb.net/2019/03/ghidra-a-quick-overview/#more-232)
  - [ShortJump](http://0xeb.net/)
    - [Using Z3 with IDA to simplify arithmetic operations in functions](http://0xeb.net/2018/03/using-z3-with-ida-to-simplify-arithmetic-operations-in-functions/)
    - [Writing a simple x86 emulator with IDAPython](http://0xeb.net/2018/02/writing-a-simple-x86-emulator-with-idapython/)
  - IDA
    - [IDAPython Tutorial with example script](https://www.youtube.com/watch?v=5ehI2wgcSGo)
    - [Using IdaPython to make your life easier](https://unit42.paloaltonetworks.com/tag/idapython/)
    - [List of IdaPlugins](https://github.com/onethawt/idaplugins-list)
    - [Running scripts from the command line with idascript](http://www.hexblog.com/?p=128)
    - [IDAPython Project for HexRays](https://github.com/idapython/src)

# Formal Methods
##  Programming for Correctness
  - [Weakest precondtions](https://www.youtube.com/watch?v=JZUTbFlKDzo&list=PL4h_iyQepxHgF_tFXlCZQG_TudIfSU8t5&index=1)
      - [UTAustin Vedio Blog](https://www.youtube.com/channel/UCZuEJqE58wmvL8wlGGSYSNw/videos)

# Technical Bloggers
  - [Simon Brand](https://blog.tartanllama.xyz/posts/)
  - [SHORTJUMP: Reversing engineering, programming and what not…](http://0xeb.net/2019/03/ghidra-a-quick-overview/#more-232)

# ISA semantics
  - [Peter Sewell](https://www.cl.cam.ac.uk/~pes20/)
    - [The Semantics of Power and ARM Multiprocessor Programs](https://www.cl.cam.ac.uk/~pes20/weakmemory/index4.html)
  - [Vedio: ISA Semantics for ARMv8-A, RISC-V, and CHERI-MIPS](https://www.youtube.com/watch?v=kvbJE6hxs7k)
  - [CakeML](https://cakeml.org/)

# Languages
  - Python
    - [What is \_\_init__.py](https://stackoverflow.com/questions/448271/what-is-init-py-for)
  - C++
    - [template specialization](http://www.cplusplus.com/doc/oldtutorial/templates/)
