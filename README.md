# OS 개발 프로젝트 

### File Structure
```

├── disk/     - File system contents
├── common.c  - Kernel/user common library: printf, memset, ...
├── common.h  - Kernel/user common library: definitions of structs and constants
├── kernel.c  - Kernel: process management, system calls, device drivers, file system
├── kernel.h  - Kernel: definitions of structs and constants
├── kernel.ld - Kernel: linker script (memory layout definition)
├── shell.c   - Command-line shell
├── user.c    - User library: functions for system calls
├── user.h    - User library: definitions of structs and constants
├── user.ld   - User: linker script (memory layout definition)
└── run.sh    - Build script

```

##### 참고자료: https://operating-system-in-1000-lines.vercel.app/en/  
##### Blog: https://sohyeonkim-dev.tistory.com/category/ComputerScience/OperatingSystem
