
_sanity:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"
#include "stat.h"

int main(){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	83 e4 f0             	and    $0xfffffff0,%esp
   8:	83 ec 30             	sub    $0x30,%esp
   int pid = fork();
   b:	e8 c0 02 00 00       	call   2d0 <fork>
   if (pid == 0) {
  10:	85 c0                	test   %eax,%eax
  12:	75 18                	jne    2c <main+0x2c>
       sleep(300);
  14:	c7 04 24 2c 01 00 00 	movl   $0x12c,(%esp)
  1b:	e8 48 03 00 00       	call   368 <sleep>
       exit(5);
  20:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  27:	e8 ac 02 00 00       	call   2d8 <exit>
   }
   else {
       int status;
       wait(&status);
  2c:	8d 44 24 2c          	lea    0x2c(%esp),%eax
  30:	89 04 24             	mov    %eax,(%esp)
  33:	e8 a8 02 00 00       	call   2e0 <wait>
       printf(1, "exit status after is %d\n",status);
  38:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  3c:	c7 44 24 04 a8 07 00 	movl   $0x7a8,0x4(%esp)
  43:	00 
  44:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4b:	89 44 24 08          	mov    %eax,0x8(%esp)
  4f:	e8 dc 03 00 00       	call   430 <printf>


    int first_status;
    int second_status;
    int third_status;
    pid = fork(); // the child pid is 99
  54:	e8 77 02 00 00       	call   2d0 <fork>
    if(pid > 0){
  59:	85 c0                	test   %eax,%eax
    pid = fork(); // the child pid is 99
  5b:	89 c3                	mov    %eax,%ebx
    if(pid > 0){
  5d:	7f 0c                	jg     6b <main+0x6b>
        second_status = detach(pid); // status = -1, because this process has already detached this child, and it doesn’t have this child anymore.
        third_status = detach(77);  // status = -1, because this process doesn’t have a child with this pid.
        printf(1, "first: %d, second: %d, third: %d\n", first_status, second_status, third_status);
         }

    exit(0);
  5f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  66:	e8 6d 02 00 00       	call   2d8 <exit>
        first_status = detach(pid);  // status = 0
  6b:	89 04 24             	mov    %eax,(%esp)
  6e:	e8 05 03 00 00       	call   378 <detach>
        second_status = detach(pid); // status = -1, because this process has already detached this child, and it doesn’t have this child anymore.
  73:	89 1c 24             	mov    %ebx,(%esp)
        first_status = detach(pid);  // status = 0
  76:	89 c6                	mov    %eax,%esi
        second_status = detach(pid); // status = -1, because this process has already detached this child, and it doesn’t have this child anymore.
  78:	e8 fb 02 00 00       	call   378 <detach>
        third_status = detach(77);  // status = -1, because this process doesn’t have a child with this pid.
  7d:	c7 04 24 4d 00 00 00 	movl   $0x4d,(%esp)
        second_status = detach(pid); // status = -1, because this process has already detached this child, and it doesn’t have this child anymore.
  84:	89 c3                	mov    %eax,%ebx
        third_status = detach(77);  // status = -1, because this process doesn’t have a child with this pid.
  86:	e8 ed 02 00 00       	call   378 <detach>
        printf(1, "first: %d, second: %d, third: %d\n", first_status, second_status, third_status);
  8b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  8f:	89 74 24 08          	mov    %esi,0x8(%esp)
  93:	c7 44 24 04 c4 07 00 	movl   $0x7c4,0x4(%esp)
  9a:	00 
  9b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a2:	89 44 24 10          	mov    %eax,0x10(%esp)
  a6:	e8 85 03 00 00       	call   430 <printf>
  ab:	eb b2                	jmp    5f <main+0x5f>
  ad:	66 90                	xchg   %ax,%ax
  af:	90                   	nop

000000b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 45 08             	mov    0x8(%ebp),%eax
  b6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  b9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  ba:	89 c2                	mov    %eax,%edx
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  c0:	41                   	inc    %ecx
  c1:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  c5:	42                   	inc    %edx
  c6:	84 db                	test   %bl,%bl
  c8:	88 5a ff             	mov    %bl,-0x1(%edx)
  cb:	75 f3                	jne    c0 <strcpy+0x10>
    ;
  return os;
}
  cd:	5b                   	pop    %ebx
  ce:	5d                   	pop    %ebp
  cf:	c3                   	ret    

000000d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  d6:	53                   	push   %ebx
  d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*p && *p == *q)
  da:	0f b6 01             	movzbl (%ecx),%eax
  dd:	0f b6 13             	movzbl (%ebx),%edx
  e0:	84 c0                	test   %al,%al
  e2:	75 18                	jne    fc <strcmp+0x2c>
  e4:	eb 22                	jmp    108 <strcmp+0x38>
  e6:	8d 76 00             	lea    0x0(%esi),%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  f0:	41                   	inc    %ecx
  while(*p && *p == *q)
  f1:	0f b6 01             	movzbl (%ecx),%eax
    p++, q++;
  f4:	43                   	inc    %ebx
  f5:	0f b6 13             	movzbl (%ebx),%edx
  while(*p && *p == *q)
  f8:	84 c0                	test   %al,%al
  fa:	74 0c                	je     108 <strcmp+0x38>
  fc:	38 d0                	cmp    %dl,%al
  fe:	74 f0                	je     f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
}
 100:	5b                   	pop    %ebx
  return (uchar)*p - (uchar)*q;
 101:	29 d0                	sub    %edx,%eax
}
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    
 105:	8d 76 00             	lea    0x0(%esi),%esi
 108:	5b                   	pop    %ebx
 109:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 10b:	29 d0                	sub    %edx,%eax
}
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    
 10f:	90                   	nop

00000110 <strlen>:

uint
strlen(const char *s)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 116:	80 39 00             	cmpb   $0x0,(%ecx)
 119:	74 15                	je     130 <strlen+0x20>
 11b:	31 d2                	xor    %edx,%edx
 11d:	8d 76 00             	lea    0x0(%esi),%esi
 120:	42                   	inc    %edx
 121:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 125:	89 d0                	mov    %edx,%eax
 127:	75 f7                	jne    120 <strlen+0x10>
    ;
  return n;
}
 129:	5d                   	pop    %ebp
 12a:	c3                   	ret    
 12b:	90                   	nop
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(n = 0; s[n]; n++)
 130:	31 c0                	xor    %eax,%eax
}
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    
 134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 13a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000140 <memset>:

void*
memset(void *dst, int c, uint n)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 55 08             	mov    0x8(%ebp),%edx
 146:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 147:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14a:	8b 45 0c             	mov    0xc(%ebp),%eax
 14d:	89 d7                	mov    %edx,%edi
 14f:	fc                   	cld    
 150:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 152:	5f                   	pop    %edi
 153:	89 d0                	mov    %edx,%eax
 155:	5d                   	pop    %ebp
 156:	c3                   	ret    
 157:	89 f6                	mov    %esi,%esi
 159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000160 <strchr>:

char*
strchr(const char *s, char c)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 16a:	0f b6 10             	movzbl (%eax),%edx
 16d:	84 d2                	test   %dl,%dl
 16f:	74 1b                	je     18c <strchr+0x2c>
    if(*s == c)
 171:	38 d1                	cmp    %dl,%cl
 173:	75 0f                	jne    184 <strchr+0x24>
 175:	eb 17                	jmp    18e <strchr+0x2e>
 177:	89 f6                	mov    %esi,%esi
 179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 180:	38 ca                	cmp    %cl,%dl
 182:	74 0a                	je     18e <strchr+0x2e>
  for(; *s; s++)
 184:	40                   	inc    %eax
 185:	0f b6 10             	movzbl (%eax),%edx
 188:	84 d2                	test   %dl,%dl
 18a:	75 f4                	jne    180 <strchr+0x20>
      return (char*)s;
  return 0;
 18c:	31 c0                	xor    %eax,%eax
}
 18e:	5d                   	pop    %ebp
 18f:	c3                   	ret    

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 195:	31 f6                	xor    %esi,%esi
{
 197:	53                   	push   %ebx
 198:	83 ec 3c             	sub    $0x3c,%esp
 19b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    cc = read(0, &c, 1);
 19e:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 1a1:	eb 32                	jmp    1d5 <gets+0x45>
 1a3:	90                   	nop
 1a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cc = read(0, &c, 1);
 1a8:	ba 01 00 00 00       	mov    $0x1,%edx
 1ad:	89 54 24 08          	mov    %edx,0x8(%esp)
 1b1:	89 7c 24 04          	mov    %edi,0x4(%esp)
 1b5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1bc:	e8 2f 01 00 00       	call   2f0 <read>
    if(cc < 1)
 1c1:	85 c0                	test   %eax,%eax
 1c3:	7e 19                	jle    1de <gets+0x4e>
      break;
    buf[i++] = c;
 1c5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1c9:	43                   	inc    %ebx
 1ca:	88 43 ff             	mov    %al,-0x1(%ebx)
    if(c == '\n' || c == '\r')
 1cd:	3c 0a                	cmp    $0xa,%al
 1cf:	74 1f                	je     1f0 <gets+0x60>
 1d1:	3c 0d                	cmp    $0xd,%al
 1d3:	74 1b                	je     1f0 <gets+0x60>
  for(i=0; i+1 < max; ){
 1d5:	46                   	inc    %esi
 1d6:	3b 75 0c             	cmp    0xc(%ebp),%esi
 1d9:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 1dc:	7c ca                	jl     1a8 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 1de:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 1e1:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
}
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	83 c4 3c             	add    $0x3c,%esp
 1ea:	5b                   	pop    %ebx
 1eb:	5e                   	pop    %esi
 1ec:	5f                   	pop    %edi
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    
 1ef:	90                   	nop
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	01 c6                	add    %eax,%esi
 1f5:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 1f8:	eb e4                	jmp    1de <gets+0x4e>
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000200 <stat>:

int
stat(const char *n, struct stat *st)
{
 200:	55                   	push   %ebp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 201:	31 c0                	xor    %eax,%eax
{
 203:	89 e5                	mov    %esp,%ebp
 205:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
 208:	89 44 24 04          	mov    %eax,0x4(%esp)
 20c:	8b 45 08             	mov    0x8(%ebp),%eax
{
 20f:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 212:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
 215:	89 04 24             	mov    %eax,(%esp)
 218:	e8 fb 00 00 00       	call   318 <open>
  if(fd < 0)
 21d:	85 c0                	test   %eax,%eax
 21f:	78 2f                	js     250 <stat+0x50>
 221:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 223:	8b 45 0c             	mov    0xc(%ebp),%eax
 226:	89 1c 24             	mov    %ebx,(%esp)
 229:	89 44 24 04          	mov    %eax,0x4(%esp)
 22d:	e8 fe 00 00 00       	call   330 <fstat>
  close(fd);
 232:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 235:	89 c6                	mov    %eax,%esi
  close(fd);
 237:	e8 c4 00 00 00       	call   300 <close>
  return r;
}
 23c:	89 f0                	mov    %esi,%eax
 23e:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 241:	8b 75 fc             	mov    -0x4(%ebp),%esi
 244:	89 ec                	mov    %ebp,%esp
 246:	5d                   	pop    %ebp
 247:	c3                   	ret    
 248:	90                   	nop
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb e5                	jmp    23c <stat+0x3c>
 257:	89 f6                	mov    %esi,%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <atoi>:

int
atoi(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 4d 08             	mov    0x8(%ebp),%ecx
 266:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 267:	0f be 11             	movsbl (%ecx),%edx
 26a:	88 d0                	mov    %dl,%al
 26c:	2c 30                	sub    $0x30,%al
 26e:	3c 09                	cmp    $0x9,%al
  n = 0;
 270:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 275:	77 1e                	ja     295 <atoi+0x35>
 277:	89 f6                	mov    %esi,%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 280:	41                   	inc    %ecx
 281:	8d 04 80             	lea    (%eax,%eax,4),%eax
 284:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 288:	0f be 11             	movsbl (%ecx),%edx
 28b:	88 d3                	mov    %dl,%bl
 28d:	80 eb 30             	sub    $0x30,%bl
 290:	80 fb 09             	cmp    $0x9,%bl
 293:	76 eb                	jbe    280 <atoi+0x20>
  return n;
}
 295:	5b                   	pop    %ebx
 296:	5d                   	pop    %ebp
 297:	c3                   	ret    
 298:	90                   	nop
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	53                   	push   %ebx
 2a8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ae:	85 db                	test   %ebx,%ebx
 2b0:	7e 1a                	jle    2cc <memmove+0x2c>
 2b2:	31 d2                	xor    %edx,%edx
 2b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *dst++ = *src++;
 2c0:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2c4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2c7:	42                   	inc    %edx
  while(n-- > 0)
 2c8:	39 d3                	cmp    %edx,%ebx
 2ca:	75 f4                	jne    2c0 <memmove+0x20>
  return vdst;
}
 2cc:	5b                   	pop    %ebx
 2cd:	5e                   	pop    %esi
 2ce:	5d                   	pop    %ebp
 2cf:	c3                   	ret    

000002d0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2d0:	b8 01 00 00 00       	mov    $0x1,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <exit>:
SYSCALL(exit)
 2d8:	b8 02 00 00 00       	mov    $0x2,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <wait>:
SYSCALL(wait)
 2e0:	b8 03 00 00 00       	mov    $0x3,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <pipe>:
SYSCALL(pipe)
 2e8:	b8 04 00 00 00       	mov    $0x4,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <read>:
SYSCALL(read)
 2f0:	b8 05 00 00 00       	mov    $0x5,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <write>:
SYSCALL(write)
 2f8:	b8 10 00 00 00       	mov    $0x10,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <close>:
SYSCALL(close)
 300:	b8 15 00 00 00       	mov    $0x15,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <kill>:
SYSCALL(kill)
 308:	b8 06 00 00 00       	mov    $0x6,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <exec>:
SYSCALL(exec)
 310:	b8 07 00 00 00       	mov    $0x7,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <open>:
SYSCALL(open)
 318:	b8 0f 00 00 00       	mov    $0xf,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <mknod>:
SYSCALL(mknod)
 320:	b8 11 00 00 00       	mov    $0x11,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <unlink>:
SYSCALL(unlink)
 328:	b8 12 00 00 00       	mov    $0x12,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <fstat>:
SYSCALL(fstat)
 330:	b8 08 00 00 00       	mov    $0x8,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <link>:
SYSCALL(link)
 338:	b8 13 00 00 00       	mov    $0x13,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <mkdir>:
SYSCALL(mkdir)
 340:	b8 14 00 00 00       	mov    $0x14,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <chdir>:
SYSCALL(chdir)
 348:	b8 09 00 00 00       	mov    $0x9,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <dup>:
SYSCALL(dup)
 350:	b8 0a 00 00 00       	mov    $0xa,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <getpid>:
SYSCALL(getpid)
 358:	b8 0b 00 00 00       	mov    $0xb,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <sbrk>:
SYSCALL(sbrk)
 360:	b8 0c 00 00 00       	mov    $0xc,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <sleep>:
SYSCALL(sleep)
 368:	b8 0d 00 00 00       	mov    $0xd,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <uptime>:
SYSCALL(uptime)
 370:	b8 0e 00 00 00       	mov    $0xe,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <detach>:
SYSCALL(detach)
 378:	b8 16 00 00 00       	mov    $0x16,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <priority>:
SYSCALL(priority)
 380:	b8 17 00 00 00       	mov    $0x17,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    
 388:	66 90                	xchg   %ax,%ax
 38a:	66 90                	xchg   %ax,%ax
 38c:	66 90                	xchg   %ax,%ax
 38e:	66 90                	xchg   %ax,%ax

00000390 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	56                   	push   %esi
 395:	53                   	push   %ebx
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 396:	89 d3                	mov    %edx,%ebx
 398:	c1 eb 1f             	shr    $0x1f,%ebx
{
 39b:	83 ec 4c             	sub    $0x4c,%esp
  if(sgn && xx < 0){
 39e:	84 db                	test   %bl,%bl
{
 3a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3a3:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 3a5:	74 79                	je     420 <printint+0x90>
 3a7:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3ab:	74 73                	je     420 <printint+0x90>
    neg = 1;
    x = -xx;
 3ad:	f7 d8                	neg    %eax
    neg = 1;
 3af:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3b6:	31 f6                	xor    %esi,%esi
 3b8:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3bb:	eb 05                	jmp    3c2 <printint+0x32>
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3c0:	89 fe                	mov    %edi,%esi
 3c2:	31 d2                	xor    %edx,%edx
 3c4:	f7 f1                	div    %ecx
 3c6:	8d 7e 01             	lea    0x1(%esi),%edi
 3c9:	0f b6 92 f0 07 00 00 	movzbl 0x7f0(%edx),%edx
  }while((x /= base) != 0);
 3d0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 3d2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 3d5:	75 e9                	jne    3c0 <printint+0x30>
  if(neg)
 3d7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 3da:	85 d2                	test   %edx,%edx
 3dc:	74 08                	je     3e6 <printint+0x56>
    buf[i++] = '-';
 3de:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 3e3:	8d 7e 02             	lea    0x2(%esi),%edi
 3e6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 3ea:	8b 7d c0             	mov    -0x40(%ebp),%edi
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
 3f0:	0f b6 06             	movzbl (%esi),%eax
 3f3:	4e                   	dec    %esi
  write(fd, &c, 1);
 3f4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 3f8:	89 3c 24             	mov    %edi,(%esp)
 3fb:	88 45 d7             	mov    %al,-0x29(%ebp)
 3fe:	b8 01 00 00 00       	mov    $0x1,%eax
 403:	89 44 24 08          	mov    %eax,0x8(%esp)
 407:	e8 ec fe ff ff       	call   2f8 <write>

  while(--i >= 0)
 40c:	39 de                	cmp    %ebx,%esi
 40e:	75 e0                	jne    3f0 <printint+0x60>
    putc(fd, buf[i]);
}
 410:	83 c4 4c             	add    $0x4c,%esp
 413:	5b                   	pop    %ebx
 414:	5e                   	pop    %esi
 415:	5f                   	pop    %edi
 416:	5d                   	pop    %ebp
 417:	c3                   	ret    
 418:	90                   	nop
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 420:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 427:	eb 8d                	jmp    3b6 <printint+0x26>
 429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000430 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
 436:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 439:	8b 75 0c             	mov    0xc(%ebp),%esi
 43c:	0f b6 1e             	movzbl (%esi),%ebx
 43f:	84 db                	test   %bl,%bl
 441:	0f 84 d1 00 00 00    	je     518 <printf+0xe8>
  state = 0;
 447:	31 ff                	xor    %edi,%edi
 449:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 44a:	8d 45 10             	lea    0x10(%ebp),%eax
  write(fd, &c, 1);
 44d:	89 fa                	mov    %edi,%edx
 44f:	8b 7d 08             	mov    0x8(%ebp),%edi
  ap = (uint*)(void*)&fmt + 1;
 452:	89 45 d0             	mov    %eax,-0x30(%ebp)
 455:	eb 41                	jmp    498 <printf+0x68>
 457:	89 f6                	mov    %esi,%esi
 459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 460:	83 f8 25             	cmp    $0x25,%eax
 463:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 466:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 46b:	74 1e                	je     48b <printf+0x5b>
  write(fd, &c, 1);
 46d:	b8 01 00 00 00       	mov    $0x1,%eax
 472:	89 44 24 08          	mov    %eax,0x8(%esp)
 476:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 479:	89 44 24 04          	mov    %eax,0x4(%esp)
 47d:	89 3c 24             	mov    %edi,(%esp)
 480:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 483:	e8 70 fe ff ff       	call   2f8 <write>
 488:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 48b:	46                   	inc    %esi
  for(i = 0; fmt[i]; i++){
 48c:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 490:	84 db                	test   %bl,%bl
 492:	0f 84 80 00 00 00    	je     518 <printf+0xe8>
    if(state == 0){
 498:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
 49a:	0f be cb             	movsbl %bl,%ecx
 49d:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4a0:	74 be                	je     460 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4a2:	83 fa 25             	cmp    $0x25,%edx
 4a5:	75 e4                	jne    48b <printf+0x5b>
      if(c == 'd'){
 4a7:	83 f8 64             	cmp    $0x64,%eax
 4aa:	0f 84 f0 00 00 00    	je     5a0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4b0:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4b6:	83 f9 70             	cmp    $0x70,%ecx
 4b9:	74 65                	je     520 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4bb:	83 f8 73             	cmp    $0x73,%eax
 4be:	0f 84 8c 00 00 00    	je     550 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4c4:	83 f8 63             	cmp    $0x63,%eax
 4c7:	0f 84 13 01 00 00    	je     5e0 <printf+0x1b0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4cd:	83 f8 25             	cmp    $0x25,%eax
 4d0:	0f 84 e2 00 00 00    	je     5b8 <printf+0x188>
  write(fd, &c, 1);
 4d6:	b8 01 00 00 00       	mov    $0x1,%eax
 4db:	46                   	inc    %esi
 4dc:	89 44 24 08          	mov    %eax,0x8(%esp)
 4e0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4e3:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e7:	89 3c 24             	mov    %edi,(%esp)
 4ea:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4ee:	e8 05 fe ff ff       	call   2f8 <write>
 4f3:	ba 01 00 00 00       	mov    $0x1,%edx
 4f8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4fb:	89 54 24 08          	mov    %edx,0x8(%esp)
 4ff:	89 44 24 04          	mov    %eax,0x4(%esp)
 503:	89 3c 24             	mov    %edi,(%esp)
 506:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 509:	e8 ea fd ff ff       	call   2f8 <write>
  for(i = 0; fmt[i]; i++){
 50e:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 512:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 514:	84 db                	test   %bl,%bl
 516:	75 80                	jne    498 <printf+0x68>
    }
  }
}
 518:	83 c4 3c             	add    $0x3c,%esp
 51b:	5b                   	pop    %ebx
 51c:	5e                   	pop    %esi
 51d:	5f                   	pop    %edi
 51e:	5d                   	pop    %ebp
 51f:	c3                   	ret    
        printint(fd, *ap, 16, 0);
 520:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 527:	b9 10 00 00 00       	mov    $0x10,%ecx
 52c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 52f:	89 f8                	mov    %edi,%eax
 531:	8b 13                	mov    (%ebx),%edx
 533:	e8 58 fe ff ff       	call   390 <printint>
        ap++;
 538:	89 d8                	mov    %ebx,%eax
      state = 0;
 53a:	31 d2                	xor    %edx,%edx
        ap++;
 53c:	83 c0 04             	add    $0x4,%eax
 53f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 542:	e9 44 ff ff ff       	jmp    48b <printf+0x5b>
 547:	89 f6                	mov    %esi,%esi
 549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
 550:	8b 45 d0             	mov    -0x30(%ebp),%eax
 553:	8b 10                	mov    (%eax),%edx
        ap++;
 555:	83 c0 04             	add    $0x4,%eax
 558:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 55b:	85 d2                	test   %edx,%edx
 55d:	0f 84 aa 00 00 00    	je     60d <printf+0x1dd>
        while(*s != 0){
 563:	0f b6 02             	movzbl (%edx),%eax
        s = (char*)*ap;
 566:	89 d3                	mov    %edx,%ebx
        while(*s != 0){
 568:	84 c0                	test   %al,%al
 56a:	74 27                	je     593 <printf+0x163>
 56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 570:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 573:	b8 01 00 00 00       	mov    $0x1,%eax
          s++;
 578:	43                   	inc    %ebx
  write(fd, &c, 1);
 579:	89 44 24 08          	mov    %eax,0x8(%esp)
 57d:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 580:	89 44 24 04          	mov    %eax,0x4(%esp)
 584:	89 3c 24             	mov    %edi,(%esp)
 587:	e8 6c fd ff ff       	call   2f8 <write>
        while(*s != 0){
 58c:	0f b6 03             	movzbl (%ebx),%eax
 58f:	84 c0                	test   %al,%al
 591:	75 dd                	jne    570 <printf+0x140>
      state = 0;
 593:	31 d2                	xor    %edx,%edx
 595:	e9 f1 fe ff ff       	jmp    48b <printf+0x5b>
 59a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5a0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5a7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5ac:	e9 7b ff ff ff       	jmp    52c <printf+0xfc>
 5b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5b8:	b9 01 00 00 00       	mov    $0x1,%ecx
 5bd:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 5c0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 5c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c8:	89 3c 24             	mov    %edi,(%esp)
 5cb:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 5ce:	e8 25 fd ff ff       	call   2f8 <write>
      state = 0;
 5d3:	31 d2                	xor    %edx,%edx
 5d5:	e9 b1 fe ff ff       	jmp    48b <printf+0x5b>
 5da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, *ap);
 5e0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5e3:	8b 03                	mov    (%ebx),%eax
        ap++;
 5e5:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 5e8:	89 3c 24             	mov    %edi,(%esp)
        putc(fd, *ap);
 5eb:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 5ee:	b8 01 00 00 00       	mov    $0x1,%eax
 5f3:	89 44 24 08          	mov    %eax,0x8(%esp)
 5f7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fe:	e8 f5 fc ff ff       	call   2f8 <write>
      state = 0;
 603:	31 d2                	xor    %edx,%edx
        ap++;
 605:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 608:	e9 7e fe ff ff       	jmp    48b <printf+0x5b>
          s = "(null)";
 60d:	bb e8 07 00 00       	mov    $0x7e8,%ebx
        while(*s != 0){
 612:	b0 28                	mov    $0x28,%al
 614:	e9 57 ff ff ff       	jmp    570 <printf+0x140>
 619:	66 90                	xchg   %ax,%ax
 61b:	66 90                	xchg   %ax,%ax
 61d:	66 90                	xchg   %ax,%ax
 61f:	90                   	nop

00000620 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 620:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 621:	a1 80 0a 00 00       	mov    0xa80,%eax
{
 626:	89 e5                	mov    %esp,%ebp
 628:	57                   	push   %edi
 629:	56                   	push   %esi
 62a:	53                   	push   %ebx
 62b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 62e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 631:	eb 0d                	jmp    640 <free+0x20>
 633:	90                   	nop
 634:	90                   	nop
 635:	90                   	nop
 636:	90                   	nop
 637:	90                   	nop
 638:	90                   	nop
 639:	90                   	nop
 63a:	90                   	nop
 63b:	90                   	nop
 63c:	90                   	nop
 63d:	90                   	nop
 63e:	90                   	nop
 63f:	90                   	nop
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 640:	39 c8                	cmp    %ecx,%eax
 642:	8b 10                	mov    (%eax),%edx
 644:	73 32                	jae    678 <free+0x58>
 646:	39 d1                	cmp    %edx,%ecx
 648:	72 04                	jb     64e <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 64a:	39 d0                	cmp    %edx,%eax
 64c:	72 32                	jb     680 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
 64e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 651:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 654:	39 fa                	cmp    %edi,%edx
 656:	74 30                	je     688 <free+0x68>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 658:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 65b:	8b 50 04             	mov    0x4(%eax),%edx
 65e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 661:	39 f1                	cmp    %esi,%ecx
 663:	74 3c                	je     6a1 <free+0x81>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 665:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 667:	5b                   	pop    %ebx
  freep = p;
 668:	a3 80 0a 00 00       	mov    %eax,0xa80
}
 66d:	5e                   	pop    %esi
 66e:	5f                   	pop    %edi
 66f:	5d                   	pop    %ebp
 670:	c3                   	ret    
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 678:	39 d0                	cmp    %edx,%eax
 67a:	72 04                	jb     680 <free+0x60>
 67c:	39 d1                	cmp    %edx,%ecx
 67e:	72 ce                	jb     64e <free+0x2e>
{
 680:	89 d0                	mov    %edx,%eax
 682:	eb bc                	jmp    640 <free+0x20>
 684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 688:	8b 7a 04             	mov    0x4(%edx),%edi
 68b:	01 fe                	add    %edi,%esi
 68d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 690:	8b 10                	mov    (%eax),%edx
 692:	8b 12                	mov    (%edx),%edx
 694:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 697:	8b 50 04             	mov    0x4(%eax),%edx
 69a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 69d:	39 f1                	cmp    %esi,%ecx
 69f:	75 c4                	jne    665 <free+0x45>
    p->s.size += bp->s.size;
 6a1:	8b 4b fc             	mov    -0x4(%ebx),%ecx
  freep = p;
 6a4:	a3 80 0a 00 00       	mov    %eax,0xa80
    p->s.size += bp->s.size;
 6a9:	01 ca                	add    %ecx,%edx
 6ab:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6ae:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6b1:	89 10                	mov    %edx,(%eax)
}
 6b3:	5b                   	pop    %ebx
 6b4:	5e                   	pop    %esi
 6b5:	5f                   	pop    %edi
 6b6:	5d                   	pop    %ebp
 6b7:	c3                   	ret    
 6b8:	90                   	nop
 6b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6cc:	8b 15 80 0a 00 00    	mov    0xa80,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6d2:	8d 78 07             	lea    0x7(%eax),%edi
 6d5:	c1 ef 03             	shr    $0x3,%edi
 6d8:	47                   	inc    %edi
  if((prevp = freep) == 0){
 6d9:	85 d2                	test   %edx,%edx
 6db:	0f 84 8f 00 00 00    	je     770 <malloc+0xb0>
 6e1:	8b 02                	mov    (%edx),%eax
 6e3:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6e6:	39 cf                	cmp    %ecx,%edi
 6e8:	76 66                	jbe    750 <malloc+0x90>
 6ea:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 6f0:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6f5:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 6f8:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6ff:	eb 10                	jmp    711 <malloc+0x51>
 701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 708:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 70a:	8b 48 04             	mov    0x4(%eax),%ecx
 70d:	39 f9                	cmp    %edi,%ecx
 70f:	73 3f                	jae    750 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 711:	39 05 80 0a 00 00    	cmp    %eax,0xa80
 717:	89 c2                	mov    %eax,%edx
 719:	75 ed                	jne    708 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 71b:	89 34 24             	mov    %esi,(%esp)
 71e:	e8 3d fc ff ff       	call   360 <sbrk>
  if(p == (char*)-1)
 723:	83 f8 ff             	cmp    $0xffffffff,%eax
 726:	74 18                	je     740 <malloc+0x80>
  hp->s.size = nu;
 728:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 72b:	83 c0 08             	add    $0x8,%eax
 72e:	89 04 24             	mov    %eax,(%esp)
 731:	e8 ea fe ff ff       	call   620 <free>
  return freep;
 736:	8b 15 80 0a 00 00    	mov    0xa80,%edx
      if((p = morecore(nunits)) == 0)
 73c:	85 d2                	test   %edx,%edx
 73e:	75 c8                	jne    708 <malloc+0x48>
        return 0;
  }
}
 740:	83 c4 1c             	add    $0x1c,%esp
        return 0;
 743:	31 c0                	xor    %eax,%eax
}
 745:	5b                   	pop    %ebx
 746:	5e                   	pop    %esi
 747:	5f                   	pop    %edi
 748:	5d                   	pop    %ebp
 749:	c3                   	ret    
 74a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 750:	39 cf                	cmp    %ecx,%edi
 752:	74 4c                	je     7a0 <malloc+0xe0>
        p->s.size -= nunits;
 754:	29 f9                	sub    %edi,%ecx
 756:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 759:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 75c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 75f:	89 15 80 0a 00 00    	mov    %edx,0xa80
}
 765:	83 c4 1c             	add    $0x1c,%esp
      return (void*)(p + 1);
 768:	83 c0 08             	add    $0x8,%eax
}
 76b:	5b                   	pop    %ebx
 76c:	5e                   	pop    %esi
 76d:	5f                   	pop    %edi
 76e:	5d                   	pop    %ebp
 76f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 770:	b8 84 0a 00 00       	mov    $0xa84,%eax
 775:	ba 84 0a 00 00       	mov    $0xa84,%edx
    base.s.size = 0;
 77a:	31 c9                	xor    %ecx,%ecx
    base.s.ptr = freep = prevp = &base;
 77c:	a3 80 0a 00 00       	mov    %eax,0xa80
    base.s.size = 0;
 781:	b8 84 0a 00 00       	mov    $0xa84,%eax
    base.s.ptr = freep = prevp = &base;
 786:	89 15 84 0a 00 00    	mov    %edx,0xa84
    base.s.size = 0;
 78c:	89 0d 88 0a 00 00    	mov    %ecx,0xa88
 792:	e9 53 ff ff ff       	jmp    6ea <malloc+0x2a>
 797:	89 f6                	mov    %esi,%esi
 799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 7a0:	8b 08                	mov    (%eax),%ecx
 7a2:	89 0a                	mov    %ecx,(%edx)
 7a4:	eb b9                	jmp    75f <malloc+0x9f>
