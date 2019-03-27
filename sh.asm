
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 e4 f0             	and    $0xfffffff0,%esp
       6:	83 ec 10             	sub    $0x10,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
       9:	eb 0e                	jmp    19 <main+0x19>
       b:	90                   	nop
       c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      10:	83 f8 02             	cmp    $0x2,%eax
      13:	0f 8f 87 00 00 00    	jg     a0 <main+0xa0>
  while((fd = open("console", O_RDWR)) >= 0){
      19:	ba 02 00 00 00       	mov    $0x2,%edx
      1e:	89 54 24 04          	mov    %edx,0x4(%esp)
      22:	c7 04 24 e3 14 00 00 	movl   $0x14e3,(%esp)
      29:	e8 7a 0f 00 00       	call   fa8 <open>
      2e:	85 c0                	test   %eax,%eax
      30:	79 de                	jns    10 <main+0x10>
      32:	eb 2b                	jmp    5f <main+0x5f>
      34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      38:	80 3d 02 1b 00 00 20 	cmpb   $0x20,0x1b02
      3f:	0f 84 85 00 00 00    	je     ca <main+0xca>
int
fork1(void)
{
  int pid;

  pid = fork();
      45:	e8 16 0f 00 00       	call   f60 <fork>
  if(pid == -1)
      4a:	83 f8 ff             	cmp    $0xffffffff,%eax
      4d:	74 45                	je     94 <main+0x94>
    if(fork1() == 0)
      4f:	85 c0                	test   %eax,%eax
      51:	74 63                	je     b6 <main+0xb6>
    wait(0);
      53:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      5a:	e8 11 0f 00 00       	call   f70 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
      5f:	b8 64 00 00 00       	mov    $0x64,%eax
      64:	89 44 24 04          	mov    %eax,0x4(%esp)
      68:	c7 04 24 00 1b 00 00 	movl   $0x1b00,(%esp)
      6f:	e8 ac 00 00 00       	call   120 <getcmd>
      74:	85 c0                	test   %eax,%eax
      76:	78 32                	js     aa <main+0xaa>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      78:	80 3d 00 1b 00 00 63 	cmpb   $0x63,0x1b00
      7f:	75 c4                	jne    45 <main+0x45>
      81:	80 3d 01 1b 00 00 64 	cmpb   $0x64,0x1b01
      88:	74 ae                	je     38 <main+0x38>
  pid = fork();
      8a:	e8 d1 0e 00 00       	call   f60 <fork>
  if(pid == -1)
      8f:	83 f8 ff             	cmp    $0xffffffff,%eax
      92:	75 bb                	jne    4f <main+0x4f>
    panic("fork");
      94:	c7 04 24 6c 14 00 00 	movl   $0x146c,(%esp)
      9b:	e8 e0 00 00 00       	call   180 <panic>
      close(fd);
      a0:	89 04 24             	mov    %eax,(%esp)
      a3:	e8 e8 0e 00 00       	call   f90 <close>
      break;
      a8:	eb b5                	jmp    5f <main+0x5f>
  exit(0);
      aa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      b1:	e8 b2 0e 00 00       	call   f68 <exit>
      runcmd(parsecmd(buf));
      b6:	c7 04 24 00 1b 00 00 	movl   $0x1b00,(%esp)
      bd:	e8 fe 0b 00 00       	call   cc0 <parsecmd>
      c2:	89 04 24             	mov    %eax,(%esp)
      c5:	e8 e6 00 00 00       	call   1b0 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      ca:	c7 04 24 00 1b 00 00 	movl   $0x1b00,(%esp)
      d1:	e8 ca 0c 00 00       	call   da0 <strlen>
      if(chdir(buf+3) < 0)
      d6:	c7 04 24 03 1b 00 00 	movl   $0x1b03,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      dd:	c6 80 ff 1a 00 00 00 	movb   $0x0,0x1aff(%eax)
      if(chdir(buf+3) < 0)
      e4:	e8 ef 0e 00 00       	call   fd8 <chdir>
      e9:	85 c0                	test   %eax,%eax
      eb:	0f 89 6e ff ff ff    	jns    5f <main+0x5f>
        printf(2, "cannot cd %s\n", buf+3);
      f1:	c7 44 24 08 03 1b 00 	movl   $0x1b03,0x8(%esp)
      f8:	00 
      f9:	c7 44 24 04 eb 14 00 	movl   $0x14eb,0x4(%esp)
     100:	00 
     101:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     108:	e8 b3 0f 00 00       	call   10c0 <printf>
     10d:	e9 4d ff ff ff       	jmp    5f <main+0x5f>
     112:	66 90                	xchg   %ax,%ax
     114:	66 90                	xchg   %ax,%ax
     116:	66 90                	xchg   %ax,%ax
     118:	66 90                	xchg   %ax,%ax
     11a:	66 90                	xchg   %ax,%ax
     11c:	66 90                	xchg   %ax,%ax
     11e:	66 90                	xchg   %ax,%ax

00000120 <getcmd>:
{
     120:	55                   	push   %ebp
  printf(2, "$ ");
     121:	b8 38 14 00 00       	mov    $0x1438,%eax
{
     126:	89 e5                	mov    %esp,%ebp
     128:	83 ec 18             	sub    $0x18,%esp
     12b:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     12e:	8b 5d 08             	mov    0x8(%ebp),%ebx
     131:	89 75 fc             	mov    %esi,-0x4(%ebp)
     134:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     137:	89 44 24 04          	mov    %eax,0x4(%esp)
     13b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     142:	e8 79 0f 00 00       	call   10c0 <printf>
  memset(buf, 0, nbuf);
     147:	31 d2                	xor    %edx,%edx
     149:	89 74 24 08          	mov    %esi,0x8(%esp)
     14d:	89 54 24 04          	mov    %edx,0x4(%esp)
     151:	89 1c 24             	mov    %ebx,(%esp)
     154:	e8 77 0c 00 00       	call   dd0 <memset>
  gets(buf, nbuf);
     159:	89 74 24 04          	mov    %esi,0x4(%esp)
     15d:	89 1c 24             	mov    %ebx,(%esp)
     160:	e8 bb 0c 00 00       	call   e20 <gets>
  if(buf[0] == 0) // EOF
     165:	31 c0                	xor    %eax,%eax
}
     167:	8b 75 fc             	mov    -0x4(%ebp),%esi
  if(buf[0] == 0) // EOF
     16a:	80 3b 00             	cmpb   $0x0,(%ebx)
}
     16d:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  if(buf[0] == 0) // EOF
     170:	0f 94 c0             	sete   %al
}
     173:	89 ec                	mov    %ebp,%esp
  if(buf[0] == 0) // EOF
     175:	f7 d8                	neg    %eax
}
     177:	5d                   	pop    %ebp
     178:	c3                   	ret    
     179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000180 <panic>:
{
     180:	55                   	push   %ebp
     181:	89 e5                	mov    %esp,%ebp
     183:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     186:	8b 45 08             	mov    0x8(%ebp),%eax
     189:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     190:	89 44 24 08          	mov    %eax,0x8(%esp)
     194:	b8 df 14 00 00       	mov    $0x14df,%eax
     199:	89 44 24 04          	mov    %eax,0x4(%esp)
     19d:	e8 1e 0f 00 00       	call   10c0 <printf>
  exit(0);
     1a2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1a9:	e8 ba 0d 00 00       	call   f68 <exit>
     1ae:	66 90                	xchg   %ax,%ax

000001b0 <runcmd>:
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	57                   	push   %edi
     1b4:	56                   	push   %esi
     1b5:	53                   	push   %ebx
     1b6:	81 ec 3c 02 00 00    	sub    $0x23c,%esp
     1bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     1bf:	85 db                	test   %ebx,%ebx
     1c1:	74 5d                	je     220 <runcmd+0x70>
  switch(cmd->type){
     1c3:	83 3b 05             	cmpl   $0x5,(%ebx)
     1c6:	0f 87 a8 01 00 00    	ja     374 <runcmd+0x1c4>
     1cc:	8b 03                	mov    (%ebx),%eax
     1ce:	ff 24 85 fc 14 00 00 	jmp    *0x14fc(,%eax,4)
    close(rcmd->fd);
     1d5:	8b 43 14             	mov    0x14(%ebx),%eax
     1d8:	89 04 24             	mov    %eax,(%esp)
     1db:	e8 b0 0d 00 00       	call   f90 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     1e0:	8b 43 10             	mov    0x10(%ebx),%eax
     1e3:	89 44 24 04          	mov    %eax,0x4(%esp)
     1e7:	8b 43 08             	mov    0x8(%ebx),%eax
     1ea:	89 04 24             	mov    %eax,(%esp)
     1ed:	e8 b6 0d 00 00       	call   fa8 <open>
     1f2:	85 c0                	test   %eax,%eax
     1f4:	79 48                	jns    23e <runcmd+0x8e>
      printf(2, "open %s failed\n", rcmd->file);
     1f6:	8b 43 08             	mov    0x8(%ebx),%eax
     1f9:	c7 44 24 04 5c 14 00 	movl   $0x145c,0x4(%esp)
     200:	00 
     201:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     208:	89 44 24 08          	mov    %eax,0x8(%esp)
     20c:	e8 af 0e 00 00       	call   10c0 <printf>
     211:	eb 0d                	jmp    220 <runcmd+0x70>
     213:	90                   	nop
     214:	90                   	nop
     215:	90                   	nop
     216:	90                   	nop
     217:	90                   	nop
     218:	90                   	nop
     219:	90                   	nop
     21a:	90                   	nop
     21b:	90                   	nop
     21c:	90                   	nop
     21d:	90                   	nop
     21e:	90                   	nop
     21f:	90                   	nop
      exit(0);
     220:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     227:	e8 3c 0d 00 00       	call   f68 <exit>
  pid = fork();
     22c:	e8 2f 0d 00 00       	call   f60 <fork>
  if(pid == -1)
     231:	83 f8 ff             	cmp    $0xffffffff,%eax
     234:	0f 84 46 01 00 00    	je     380 <runcmd+0x1d0>
    if(fork1() == 0)
     23a:	85 c0                	test   %eax,%eax
     23c:	75 e2                	jne    220 <runcmd+0x70>
      runcmd(bcmd->cmd);
     23e:	8b 43 04             	mov    0x4(%ebx),%eax
     241:	89 04 24             	mov    %eax,(%esp)
     244:	e8 67 ff ff ff       	call   1b0 <runcmd>
    if(ecmd->argv[0] == 0)
     249:	8b 43 04             	mov    0x4(%ebx),%eax
     24c:	85 c0                	test   %eax,%eax
     24e:	74 d0                	je     220 <runcmd+0x70>
    exec(ecmd->argv[0], ecmd->argv);
     250:	8d 4b 04             	lea    0x4(%ebx),%ecx
     253:	89 4c 24 04          	mov    %ecx,0x4(%esp)
     257:	89 04 24             	mov    %eax,(%esp)
     25a:	89 8d d4 fd ff ff    	mov    %ecx,-0x22c(%ebp)
     260:	e8 3b 0d 00 00       	call   fa0 <exec>
    currCmd = ecmd->argv[0];
     265:	8b 43 04             	mov    0x4(%ebx),%eax
    fd = open("/PATH.txt", O_RDONLY);
     268:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     26f:	00 
     270:	c7 04 24 42 14 00 00 	movl   $0x1442,(%esp)
    currCmd = ecmd->argv[0];
     277:	89 c7                	mov    %eax,%edi
     279:	89 85 d0 fd ff ff    	mov    %eax,-0x230(%ebp)
    fd = open("/PATH.txt", O_RDONLY);
     27f:	e8 24 0d 00 00       	call   fa8 <open>
     284:	89 c6                	mov    %eax,%esi
    if(currCmd[0] != '/'){
     286:	89 f8                	mov    %edi,%eax
  int stringInd = 0, cmdInd = 0;
     288:	31 ff                	xor    %edi,%edi
    if(currCmd[0] != '/'){
     28a:	80 38 2f             	cmpb   $0x2f,(%eax)
     28d:	0f 84 f9 00 00 00    	je     38c <runcmd+0x1dc>
      while (read(fd,c,1) != 0){
     293:	8d 85 df fd ff ff    	lea    -0x221(%ebp),%eax
     299:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     2a0:	00 
     2a1:	89 44 24 04          	mov    %eax,0x4(%esp)
     2a5:	89 34 24             	mov    %esi,(%esp)
     2a8:	e8 d3 0c 00 00       	call   f80 <read>
     2ad:	85 c0                	test   %eax,%eax
     2af:	0f 84 d7 00 00 00    	je     38c <runcmd+0x1dc>
        if (c[0]!=':'){
     2b5:	0f b6 85 df fd ff ff 	movzbl -0x221(%ebp),%eax
     2bc:	3c 3a                	cmp    $0x3a,%al
     2be:	0f 84 f0 00 00 00    	je     3b4 <runcmd+0x204>
          s[stringInd] = c[0];
     2c4:	88 84 3d e8 fd ff ff 	mov    %al,-0x218(%ebp,%edi,1)
          stringInd++;
     2cb:	47                   	inc    %edi
     2cc:	eb c5                	jmp    293 <runcmd+0xe3>
    if(pipe(p) < 0)
     2ce:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
     2d4:	89 04 24             	mov    %eax,(%esp)
     2d7:	e8 9c 0c 00 00       	call   f78 <pipe>
     2dc:	85 c0                	test   %eax,%eax
     2de:	0f 88 52 01 00 00    	js     436 <runcmd+0x286>
  pid = fork();
     2e4:	e8 77 0c 00 00       	call   f60 <fork>
  if(pid == -1)
     2e9:	83 f8 ff             	cmp    $0xffffffff,%eax
     2ec:	0f 84 8e 00 00 00    	je     380 <runcmd+0x1d0>
    if(fork1() == 0){
     2f2:	85 c0                	test   %eax,%eax
     2f4:	0f 84 48 01 00 00    	je     442 <runcmd+0x292>
     2fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  pid = fork();
     300:	e8 5b 0c 00 00       	call   f60 <fork>
  if(pid == -1)
     305:	83 f8 ff             	cmp    $0xffffffff,%eax
     308:	74 76                	je     380 <runcmd+0x1d0>
    if(fork1() == 0){
     30a:	85 c0                	test   %eax,%eax
     30c:	0f 84 e3 00 00 00    	je     3f5 <runcmd+0x245>
    close(p[0]);
     312:	8b 85 e0 fd ff ff    	mov    -0x220(%ebp),%eax
     318:	89 04 24             	mov    %eax,(%esp)
     31b:	e8 70 0c 00 00       	call   f90 <close>
    close(p[1]);
     320:	8b 85 e4 fd ff ff    	mov    -0x21c(%ebp),%eax
     326:	89 04 24             	mov    %eax,(%esp)
     329:	e8 62 0c 00 00       	call   f90 <close>
    wait(0);
     32e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     335:	e8 36 0c 00 00       	call   f70 <wait>
    wait(0);
     33a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     341:	e8 2a 0c 00 00       	call   f70 <wait>
    break;
     346:	e9 d5 fe ff ff       	jmp    220 <runcmd+0x70>
  pid = fork();
     34b:	e8 10 0c 00 00       	call   f60 <fork>
  if(pid == -1)
     350:	83 f8 ff             	cmp    $0xffffffff,%eax
     353:	74 2b                	je     380 <runcmd+0x1d0>
    if(fork1() == 0)
     355:	85 c0                	test   %eax,%eax
     357:	0f 84 e1 fe ff ff    	je     23e <runcmd+0x8e>
    wait(0);
     35d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     364:	e8 07 0c 00 00       	call   f70 <wait>
    runcmd(lcmd->right);
     369:	8b 43 08             	mov    0x8(%ebx),%eax
     36c:	89 04 24             	mov    %eax,(%esp)
     36f:	e8 3c fe ff ff       	call   1b0 <runcmd>
    panic("runcmd");
     374:	c7 04 24 3b 14 00 00 	movl   $0x143b,(%esp)
     37b:	e8 00 fe ff ff       	call   180 <panic>
    panic("fork");
     380:	c7 04 24 6c 14 00 00 	movl   $0x146c,(%esp)
     387:	e8 f4 fd ff ff       	call   180 <panic>
      printf(2, "exec %s failed\n", ecmd->argv[0]);
     38c:	8b 43 04             	mov    0x4(%ebx),%eax
     38f:	c7 44 24 04 4c 14 00 	movl   $0x144c,0x4(%esp)
     396:	00 
     397:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     39e:	89 44 24 08          	mov    %eax,0x8(%esp)
     3a2:	e8 19 0d 00 00       	call   10c0 <printf>
    close(fd);
     3a7:	89 34 24             	mov    %esi,(%esp)
     3aa:	e8 e1 0b 00 00       	call   f90 <close>
    break;
     3af:	e9 6c fe ff ff       	jmp    220 <runcmd+0x70>
          while(currCmd[cmdInd] != 0){
     3b4:	8b 95 d0 fd ff ff    	mov    -0x230(%ebp),%edx
     3ba:	29 fa                	sub    %edi,%edx
     3bc:	eb 08                	jmp    3c6 <runcmd+0x216>
            s[stringInd] = currCmd[cmdInd];
     3be:	88 84 3d e8 fd ff ff 	mov    %al,-0x218(%ebp,%edi,1)
            stringInd++;
     3c5:	47                   	inc    %edi
          while(currCmd[cmdInd] != 0){
     3c6:	0f b6 04 3a          	movzbl (%edx,%edi,1),%eax
     3ca:	84 c0                	test   %al,%al
     3cc:	75 f0                	jne    3be <runcmd+0x20e>
          exec(s, ecmd->argv);
     3ce:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
          s[stringInd] = 0;
     3d4:	c6 84 3d e8 fd ff ff 	movb   $0x0,-0x218(%ebp,%edi,1)
     3db:	00 
          stringInd = 0;
     3dc:	31 ff                	xor    %edi,%edi
          exec(s, ecmd->argv);
     3de:	89 44 24 04          	mov    %eax,0x4(%esp)
     3e2:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     3e8:	89 04 24             	mov    %eax,(%esp)
     3eb:	e8 b0 0b 00 00       	call   fa0 <exec>
     3f0:	e9 9e fe ff ff       	jmp    293 <runcmd+0xe3>
      close(0);
     3f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     3fc:	e8 8f 0b 00 00       	call   f90 <close>
      dup(p[0]);
     401:	8b 85 e0 fd ff ff    	mov    -0x220(%ebp),%eax
     407:	89 04 24             	mov    %eax,(%esp)
     40a:	e8 d1 0b 00 00       	call   fe0 <dup>
      close(p[0]);
     40f:	8b 85 e0 fd ff ff    	mov    -0x220(%ebp),%eax
     415:	89 04 24             	mov    %eax,(%esp)
     418:	e8 73 0b 00 00       	call   f90 <close>
      close(p[1]);
     41d:	8b 85 e4 fd ff ff    	mov    -0x21c(%ebp),%eax
     423:	89 04 24             	mov    %eax,(%esp)
     426:	e8 65 0b 00 00       	call   f90 <close>
      runcmd(pcmd->right);
     42b:	8b 43 08             	mov    0x8(%ebx),%eax
     42e:	89 04 24             	mov    %eax,(%esp)
     431:	e8 7a fd ff ff       	call   1b0 <runcmd>
      panic("pipe");
     436:	c7 04 24 71 14 00 00 	movl   $0x1471,(%esp)
     43d:	e8 3e fd ff ff       	call   180 <panic>
      close(1);
     442:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     449:	e8 42 0b 00 00       	call   f90 <close>
      dup(p[1]);
     44e:	8b 85 e4 fd ff ff    	mov    -0x21c(%ebp),%eax
     454:	89 04 24             	mov    %eax,(%esp)
     457:	e8 84 0b 00 00       	call   fe0 <dup>
      close(p[0]);
     45c:	8b 85 e0 fd ff ff    	mov    -0x220(%ebp),%eax
     462:	89 04 24             	mov    %eax,(%esp)
     465:	e8 26 0b 00 00       	call   f90 <close>
      close(p[1]);
     46a:	8b 85 e4 fd ff ff    	mov    -0x21c(%ebp),%eax
     470:	89 04 24             	mov    %eax,(%esp)
     473:	e8 18 0b 00 00       	call   f90 <close>
      runcmd(pcmd->left);
     478:	8b 43 04             	mov    0x4(%ebx),%eax
     47b:	89 04 24             	mov    %eax,(%esp)
     47e:	e8 2d fd ff ff       	call   1b0 <runcmd>
     483:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000490 <fork1>:
{
     490:	55                   	push   %ebp
     491:	89 e5                	mov    %esp,%ebp
     493:	83 ec 18             	sub    $0x18,%esp
  pid = fork();
     496:	e8 c5 0a 00 00       	call   f60 <fork>
  if(pid == -1)
     49b:	83 f8 ff             	cmp    $0xffffffff,%eax
     49e:	74 02                	je     4a2 <fork1+0x12>
  return pid;
}
     4a0:	c9                   	leave  
     4a1:	c3                   	ret    
    panic("fork");
     4a2:	c7 04 24 6c 14 00 00 	movl   $0x146c,(%esp)
     4a9:	e8 d2 fc ff ff       	call   180 <panic>
     4ae:	66 90                	xchg   %ax,%ax

000004b0 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     4b0:	55                   	push   %ebp
     4b1:	89 e5                	mov    %esp,%ebp
     4b3:	53                   	push   %ebx
     4b4:	83 ec 14             	sub    $0x14,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4b7:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     4be:	e8 8d 0e 00 00       	call   1350 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     4c3:	31 d2                	xor    %edx,%edx
     4c5:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     4c9:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     4cb:	b8 54 00 00 00       	mov    $0x54,%eax
     4d0:	89 1c 24             	mov    %ebx,(%esp)
     4d3:	89 44 24 08          	mov    %eax,0x8(%esp)
     4d7:	e8 f4 08 00 00       	call   dd0 <memset>
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}
     4dc:	89 d8                	mov    %ebx,%eax
  cmd->type = EXEC;
     4de:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
}
     4e4:	83 c4 14             	add    $0x14,%esp
     4e7:	5b                   	pop    %ebx
     4e8:	5d                   	pop    %ebp
     4e9:	c3                   	ret    
     4ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004f0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     4f0:	55                   	push   %ebp
     4f1:	89 e5                	mov    %esp,%ebp
     4f3:	53                   	push   %ebx
     4f4:	83 ec 14             	sub    $0x14,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4f7:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     4fe:	e8 4d 0e 00 00       	call   1350 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     503:	31 d2                	xor    %edx,%edx
     505:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     509:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     50b:	b8 18 00 00 00       	mov    $0x18,%eax
     510:	89 1c 24             	mov    %ebx,(%esp)
     513:	89 44 24 08          	mov    %eax,0x8(%esp)
     517:	e8 b4 08 00 00       	call   dd0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     51c:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     51f:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     525:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     528:	8b 45 0c             	mov    0xc(%ebp),%eax
     52b:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     52e:	8b 45 10             	mov    0x10(%ebp),%eax
     531:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     534:	8b 45 14             	mov    0x14(%ebp),%eax
     537:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     53a:	8b 45 18             	mov    0x18(%ebp),%eax
     53d:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     540:	83 c4 14             	add    $0x14,%esp
     543:	89 d8                	mov    %ebx,%eax
     545:	5b                   	pop    %ebx
     546:	5d                   	pop    %ebp
     547:	c3                   	ret    
     548:	90                   	nop
     549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000550 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     550:	55                   	push   %ebp
     551:	89 e5                	mov    %esp,%ebp
     553:	53                   	push   %ebx
     554:	83 ec 14             	sub    $0x14,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     557:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     55e:	e8 ed 0d 00 00       	call   1350 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     563:	31 d2                	xor    %edx,%edx
     565:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     569:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     56b:	b8 0c 00 00 00       	mov    $0xc,%eax
     570:	89 1c 24             	mov    %ebx,(%esp)
     573:	89 44 24 08          	mov    %eax,0x8(%esp)
     577:	e8 54 08 00 00       	call   dd0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     57c:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     57f:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     585:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     588:	8b 45 0c             	mov    0xc(%ebp),%eax
     58b:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     58e:	83 c4 14             	add    $0x14,%esp
     591:	89 d8                	mov    %ebx,%eax
     593:	5b                   	pop    %ebx
     594:	5d                   	pop    %ebp
     595:	c3                   	ret    
     596:	8d 76 00             	lea    0x0(%esi),%esi
     599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005a0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     5a0:	55                   	push   %ebp
     5a1:	89 e5                	mov    %esp,%ebp
     5a3:	53                   	push   %ebx
     5a4:	83 ec 14             	sub    $0x14,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5a7:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     5ae:	e8 9d 0d 00 00       	call   1350 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     5b3:	31 d2                	xor    %edx,%edx
     5b5:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     5b9:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     5bb:	b8 0c 00 00 00       	mov    $0xc,%eax
     5c0:	89 1c 24             	mov    %ebx,(%esp)
     5c3:	89 44 24 08          	mov    %eax,0x8(%esp)
     5c7:	e8 04 08 00 00       	call   dd0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     5cc:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     5cf:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     5d5:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     5d8:	8b 45 0c             	mov    0xc(%ebp),%eax
     5db:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     5de:	83 c4 14             	add    $0x14,%esp
     5e1:	89 d8                	mov    %ebx,%eax
     5e3:	5b                   	pop    %ebx
     5e4:	5d                   	pop    %ebp
     5e5:	c3                   	ret    
     5e6:	8d 76 00             	lea    0x0(%esi),%esi
     5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005f0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     5f0:	55                   	push   %ebp
     5f1:	89 e5                	mov    %esp,%ebp
     5f3:	53                   	push   %ebx
     5f4:	83 ec 14             	sub    $0x14,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5f7:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     5fe:	e8 4d 0d 00 00       	call   1350 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     603:	31 d2                	xor    %edx,%edx
     605:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     609:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     60b:	b8 08 00 00 00       	mov    $0x8,%eax
     610:	89 1c 24             	mov    %ebx,(%esp)
     613:	89 44 24 08          	mov    %eax,0x8(%esp)
     617:	e8 b4 07 00 00       	call   dd0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     61c:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     61f:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     625:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     628:	83 c4 14             	add    $0x14,%esp
     62b:	89 d8                	mov    %ebx,%eax
     62d:	5b                   	pop    %ebx
     62e:	5d                   	pop    %ebp
     62f:	c3                   	ret    

00000630 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     630:	55                   	push   %ebp
     631:	89 e5                	mov    %esp,%ebp
     633:	57                   	push   %edi
     634:	56                   	push   %esi
     635:	53                   	push   %ebx
     636:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int ret;

  s = *ps;
     639:	8b 45 08             	mov    0x8(%ebp),%eax
{
     63c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     63f:	8b 7d 10             	mov    0x10(%ebp),%edi
  s = *ps;
     642:	8b 30                	mov    (%eax),%esi
  while(s < es && strchr(whitespace, *s))
     644:	39 de                	cmp    %ebx,%esi
     646:	72 0d                	jb     655 <gettoken+0x25>
     648:	eb 22                	jmp    66c <gettoken+0x3c>
     64a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     650:	46                   	inc    %esi
  while(s < es && strchr(whitespace, *s))
     651:	39 f3                	cmp    %esi,%ebx
     653:	74 17                	je     66c <gettoken+0x3c>
     655:	0f be 06             	movsbl (%esi),%eax
     658:	c7 04 24 ec 1a 00 00 	movl   $0x1aec,(%esp)
     65f:	89 44 24 04          	mov    %eax,0x4(%esp)
     663:	e8 88 07 00 00       	call   df0 <strchr>
     668:	85 c0                	test   %eax,%eax
     66a:	75 e4                	jne    650 <gettoken+0x20>
  if(q)
     66c:	85 ff                	test   %edi,%edi
     66e:	74 02                	je     672 <gettoken+0x42>
    *q = s;
     670:	89 37                	mov    %esi,(%edi)
  ret = *s;
     672:	0f be 06             	movsbl (%esi),%eax
  switch(*s){
     675:	3c 29                	cmp    $0x29,%al
     677:	7f 57                	jg     6d0 <gettoken+0xa0>
     679:	3c 28                	cmp    $0x28,%al
     67b:	0f 8d cb 00 00 00    	jge    74c <gettoken+0x11c>
     681:	31 ff                	xor    %edi,%edi
     683:	84 c0                	test   %al,%al
     685:	0f 85 cd 00 00 00    	jne    758 <gettoken+0x128>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     68b:	8b 55 14             	mov    0x14(%ebp),%edx
     68e:	85 d2                	test   %edx,%edx
     690:	74 05                	je     697 <gettoken+0x67>
    *eq = s;
     692:	8b 45 14             	mov    0x14(%ebp),%eax
     695:	89 30                	mov    %esi,(%eax)

  while(s < es && strchr(whitespace, *s))
     697:	39 de                	cmp    %ebx,%esi
     699:	72 0a                	jb     6a5 <gettoken+0x75>
     69b:	eb 1f                	jmp    6bc <gettoken+0x8c>
     69d:	8d 76 00             	lea    0x0(%esi),%esi
    s++;
     6a0:	46                   	inc    %esi
  while(s < es && strchr(whitespace, *s))
     6a1:	39 f3                	cmp    %esi,%ebx
     6a3:	74 17                	je     6bc <gettoken+0x8c>
     6a5:	0f be 06             	movsbl (%esi),%eax
     6a8:	c7 04 24 ec 1a 00 00 	movl   $0x1aec,(%esp)
     6af:	89 44 24 04          	mov    %eax,0x4(%esp)
     6b3:	e8 38 07 00 00       	call   df0 <strchr>
     6b8:	85 c0                	test   %eax,%eax
     6ba:	75 e4                	jne    6a0 <gettoken+0x70>
  *ps = s;
     6bc:	8b 45 08             	mov    0x8(%ebp),%eax
     6bf:	89 30                	mov    %esi,(%eax)
  return ret;
}
     6c1:	83 c4 1c             	add    $0x1c,%esp
     6c4:	89 f8                	mov    %edi,%eax
     6c6:	5b                   	pop    %ebx
     6c7:	5e                   	pop    %esi
     6c8:	5f                   	pop    %edi
     6c9:	5d                   	pop    %ebp
     6ca:	c3                   	ret    
     6cb:	90                   	nop
     6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     6d0:	3c 3e                	cmp    $0x3e,%al
     6d2:	75 1c                	jne    6f0 <gettoken+0xc0>
    if(*s == '>'){
     6d4:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
    s++;
     6d8:	8d 46 01             	lea    0x1(%esi),%eax
    if(*s == '>'){
     6db:	0f 84 94 00 00 00    	je     775 <gettoken+0x145>
    s++;
     6e1:	89 c6                	mov    %eax,%esi
     6e3:	bf 3e 00 00 00       	mov    $0x3e,%edi
     6e8:	eb a1                	jmp    68b <gettoken+0x5b>
     6ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  switch(*s){
     6f0:	7f 56                	jg     748 <gettoken+0x118>
     6f2:	88 c1                	mov    %al,%cl
     6f4:	80 e9 3b             	sub    $0x3b,%cl
     6f7:	80 f9 01             	cmp    $0x1,%cl
     6fa:	76 50                	jbe    74c <gettoken+0x11c>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     6fc:	39 f3                	cmp    %esi,%ebx
     6fe:	77 27                	ja     727 <gettoken+0xf7>
     700:	eb 5e                	jmp    760 <gettoken+0x130>
     702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     708:	0f be 06             	movsbl (%esi),%eax
     70b:	c7 04 24 e4 1a 00 00 	movl   $0x1ae4,(%esp)
     712:	89 44 24 04          	mov    %eax,0x4(%esp)
     716:	e8 d5 06 00 00       	call   df0 <strchr>
     71b:	85 c0                	test   %eax,%eax
     71d:	75 1c                	jne    73b <gettoken+0x10b>
      s++;
     71f:	46                   	inc    %esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     720:	39 f3                	cmp    %esi,%ebx
     722:	74 3c                	je     760 <gettoken+0x130>
     724:	0f be 06             	movsbl (%esi),%eax
     727:	89 44 24 04          	mov    %eax,0x4(%esp)
     72b:	c7 04 24 ec 1a 00 00 	movl   $0x1aec,(%esp)
     732:	e8 b9 06 00 00       	call   df0 <strchr>
     737:	85 c0                	test   %eax,%eax
     739:	74 cd                	je     708 <gettoken+0xd8>
    ret = 'a';
     73b:	bf 61 00 00 00       	mov    $0x61,%edi
     740:	e9 46 ff ff ff       	jmp    68b <gettoken+0x5b>
     745:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     748:	3c 7c                	cmp    $0x7c,%al
     74a:	75 b0                	jne    6fc <gettoken+0xcc>
  ret = *s;
     74c:	0f be f8             	movsbl %al,%edi
    s++;
     74f:	46                   	inc    %esi
    break;
     750:	e9 36 ff ff ff       	jmp    68b <gettoken+0x5b>
     755:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     758:	3c 26                	cmp    $0x26,%al
     75a:	75 a0                	jne    6fc <gettoken+0xcc>
     75c:	eb ee                	jmp    74c <gettoken+0x11c>
     75e:	66 90                	xchg   %ax,%ax
  if(eq)
     760:	8b 45 14             	mov    0x14(%ebp),%eax
     763:	bf 61 00 00 00       	mov    $0x61,%edi
     768:	85 c0                	test   %eax,%eax
     76a:	0f 85 22 ff ff ff    	jne    692 <gettoken+0x62>
     770:	e9 47 ff ff ff       	jmp    6bc <gettoken+0x8c>
      s++;
     775:	83 c6 02             	add    $0x2,%esi
      ret = '+';
     778:	bf 2b 00 00 00       	mov    $0x2b,%edi
     77d:	e9 09 ff ff ff       	jmp    68b <gettoken+0x5b>
     782:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000790 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     790:	55                   	push   %ebp
     791:	89 e5                	mov    %esp,%ebp
     793:	57                   	push   %edi
     794:	56                   	push   %esi
     795:	53                   	push   %ebx
     796:	83 ec 1c             	sub    $0x1c,%esp
     799:	8b 7d 08             	mov    0x8(%ebp),%edi
     79c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     79f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     7a1:	39 f3                	cmp    %esi,%ebx
     7a3:	72 10                	jb     7b5 <peek+0x25>
     7a5:	eb 25                	jmp    7cc <peek+0x3c>
     7a7:	89 f6                	mov    %esi,%esi
     7a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     7b0:	43                   	inc    %ebx
  while(s < es && strchr(whitespace, *s))
     7b1:	39 de                	cmp    %ebx,%esi
     7b3:	74 17                	je     7cc <peek+0x3c>
     7b5:	0f be 03             	movsbl (%ebx),%eax
     7b8:	c7 04 24 ec 1a 00 00 	movl   $0x1aec,(%esp)
     7bf:	89 44 24 04          	mov    %eax,0x4(%esp)
     7c3:	e8 28 06 00 00       	call   df0 <strchr>
     7c8:	85 c0                	test   %eax,%eax
     7ca:	75 e4                	jne    7b0 <peek+0x20>
  *ps = s;
     7cc:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     7ce:	31 c0                	xor    %eax,%eax
     7d0:	0f be 13             	movsbl (%ebx),%edx
     7d3:	84 d2                	test   %dl,%dl
     7d5:	74 17                	je     7ee <peek+0x5e>
     7d7:	8b 45 10             	mov    0x10(%ebp),%eax
     7da:	89 54 24 04          	mov    %edx,0x4(%esp)
     7de:	89 04 24             	mov    %eax,(%esp)
     7e1:	e8 0a 06 00 00       	call   df0 <strchr>
     7e6:	85 c0                	test   %eax,%eax
     7e8:	0f 95 c0             	setne  %al
     7eb:	0f b6 c0             	movzbl %al,%eax
}
     7ee:	83 c4 1c             	add    $0x1c,%esp
     7f1:	5b                   	pop    %ebx
     7f2:	5e                   	pop    %esi
     7f3:	5f                   	pop    %edi
     7f4:	5d                   	pop    %ebp
     7f5:	c3                   	ret    
     7f6:	8d 76 00             	lea    0x0(%esi),%esi
     7f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000800 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     800:	55                   	push   %ebp
     801:	89 e5                	mov    %esp,%ebp
     803:	57                   	push   %edi
     804:	56                   	push   %esi
     805:	53                   	push   %ebx
     806:	83 ec 3c             	sub    $0x3c,%esp
     809:	8b 75 0c             	mov    0xc(%ebp),%esi
     80c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     80f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     810:	b8 93 14 00 00       	mov    $0x1493,%eax
     815:	89 44 24 08          	mov    %eax,0x8(%esp)
     819:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     81d:	89 34 24             	mov    %esi,(%esp)
     820:	e8 6b ff ff ff       	call   790 <peek>
     825:	85 c0                	test   %eax,%eax
     827:	0f 84 93 00 00 00    	je     8c0 <parseredirs+0xc0>
    tok = gettoken(ps, es, 0, 0);
     82d:	31 c0                	xor    %eax,%eax
     82f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     833:	31 c0                	xor    %eax,%eax
     835:	89 44 24 08          	mov    %eax,0x8(%esp)
     839:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     83d:	89 34 24             	mov    %esi,(%esp)
     840:	e8 eb fd ff ff       	call   630 <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
     845:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     849:	89 34 24             	mov    %esi,(%esp)
    tok = gettoken(ps, es, 0, 0);
     84c:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     84e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     851:	89 44 24 0c          	mov    %eax,0xc(%esp)
     855:	8d 45 e0             	lea    -0x20(%ebp),%eax
     858:	89 44 24 08          	mov    %eax,0x8(%esp)
     85c:	e8 cf fd ff ff       	call   630 <gettoken>
     861:	83 f8 61             	cmp    $0x61,%eax
     864:	75 65                	jne    8cb <parseredirs+0xcb>
      panic("missing file for redirection");
    switch(tok){
     866:	83 ff 3c             	cmp    $0x3c,%edi
     869:	74 45                	je     8b0 <parseredirs+0xb0>
     86b:	83 ff 3e             	cmp    $0x3e,%edi
     86e:	66 90                	xchg   %ax,%ax
     870:	74 05                	je     877 <parseredirs+0x77>
     872:	83 ff 2b             	cmp    $0x2b,%edi
     875:	75 99                	jne    810 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     877:	ba 01 00 00 00       	mov    $0x1,%edx
     87c:	b9 01 02 00 00       	mov    $0x201,%ecx
     881:	89 54 24 10          	mov    %edx,0x10(%esp)
     885:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     889:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     88c:	89 44 24 08          	mov    %eax,0x8(%esp)
     890:	8b 45 e0             	mov    -0x20(%ebp),%eax
     893:	89 44 24 04          	mov    %eax,0x4(%esp)
     897:	8b 45 08             	mov    0x8(%ebp),%eax
     89a:	89 04 24             	mov    %eax,(%esp)
     89d:	e8 4e fc ff ff       	call   4f0 <redircmd>
     8a2:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     8a5:	e9 66 ff ff ff       	jmp    810 <parseredirs+0x10>
     8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     8b0:	31 ff                	xor    %edi,%edi
     8b2:	31 c0                	xor    %eax,%eax
     8b4:	89 7c 24 10          	mov    %edi,0x10(%esp)
     8b8:	89 44 24 0c          	mov    %eax,0xc(%esp)
     8bc:	eb cb                	jmp    889 <parseredirs+0x89>
     8be:	66 90                	xchg   %ax,%ax
    }
  }
  return cmd;
}
     8c0:	8b 45 08             	mov    0x8(%ebp),%eax
     8c3:	83 c4 3c             	add    $0x3c,%esp
     8c6:	5b                   	pop    %ebx
     8c7:	5e                   	pop    %esi
     8c8:	5f                   	pop    %edi
     8c9:	5d                   	pop    %ebp
     8ca:	c3                   	ret    
      panic("missing file for redirection");
     8cb:	c7 04 24 76 14 00 00 	movl   $0x1476,(%esp)
     8d2:	e8 a9 f8 ff ff       	call   180 <panic>
     8d7:	89 f6                	mov    %esi,%esi
     8d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008e0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     8e0:	55                   	push   %ebp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     8e1:	ba 96 14 00 00       	mov    $0x1496,%edx
{
     8e6:	89 e5                	mov    %esp,%ebp
     8e8:	57                   	push   %edi
     8e9:	56                   	push   %esi
     8ea:	53                   	push   %ebx
     8eb:	83 ec 3c             	sub    $0x3c,%esp
     8ee:	8b 75 08             	mov    0x8(%ebp),%esi
     8f1:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(peek(ps, es, "("))
     8f4:	89 54 24 08          	mov    %edx,0x8(%esp)
     8f8:	89 34 24             	mov    %esi,(%esp)
     8fb:	89 7c 24 04          	mov    %edi,0x4(%esp)
     8ff:	e8 8c fe ff ff       	call   790 <peek>
     904:	85 c0                	test   %eax,%eax
     906:	0f 85 9c 00 00 00    	jne    9a8 <parseexec+0xc8>
     90c:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     90e:	e8 9d fb ff ff       	call   4b0 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     913:	89 7c 24 08          	mov    %edi,0x8(%esp)
     917:	89 74 24 04          	mov    %esi,0x4(%esp)
     91b:	89 04 24             	mov    %eax,(%esp)
  ret = execcmd();
     91e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = parseredirs(ret, ps, es);
     921:	e8 da fe ff ff       	call   800 <parseredirs>
     926:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     929:	eb 1b                	jmp    946 <parseexec+0x66>
     92b:	90                   	nop
     92c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     930:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     933:	89 7c 24 08          	mov    %edi,0x8(%esp)
     937:	89 74 24 04          	mov    %esi,0x4(%esp)
     93b:	89 04 24             	mov    %eax,(%esp)
     93e:	e8 bd fe ff ff       	call   800 <parseredirs>
     943:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     946:	b8 ad 14 00 00       	mov    $0x14ad,%eax
     94b:	89 44 24 08          	mov    %eax,0x8(%esp)
     94f:	89 7c 24 04          	mov    %edi,0x4(%esp)
     953:	89 34 24             	mov    %esi,(%esp)
     956:	e8 35 fe ff ff       	call   790 <peek>
     95b:	85 c0                	test   %eax,%eax
     95d:	75 69                	jne    9c8 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     95f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     962:	89 44 24 0c          	mov    %eax,0xc(%esp)
     966:	8d 45 e0             	lea    -0x20(%ebp),%eax
     969:	89 44 24 08          	mov    %eax,0x8(%esp)
     96d:	89 7c 24 04          	mov    %edi,0x4(%esp)
     971:	89 34 24             	mov    %esi,(%esp)
     974:	e8 b7 fc ff ff       	call   630 <gettoken>
     979:	85 c0                	test   %eax,%eax
     97b:	74 4b                	je     9c8 <parseexec+0xe8>
    if(tok != 'a')
     97d:	83 f8 61             	cmp    $0x61,%eax
     980:	75 65                	jne    9e7 <parseexec+0x107>
    cmd->argv[argc] = q;
     982:	8b 45 e0             	mov    -0x20(%ebp),%eax
     985:	8b 55 d0             	mov    -0x30(%ebp),%edx
     988:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     98c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     98f:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     993:	43                   	inc    %ebx
    if(argc >= MAXARGS)
     994:	83 fb 0a             	cmp    $0xa,%ebx
     997:	75 97                	jne    930 <parseexec+0x50>
      panic("too many args");
     999:	c7 04 24 9f 14 00 00 	movl   $0x149f,(%esp)
     9a0:	e8 db f7 ff ff       	call   180 <panic>
     9a5:	8d 76 00             	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     9a8:	89 7c 24 04          	mov    %edi,0x4(%esp)
     9ac:	89 34 24             	mov    %esi,(%esp)
     9af:	e8 9c 01 00 00       	call   b50 <parseblock>
     9b4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     9b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     9ba:	83 c4 3c             	add    $0x3c,%esp
     9bd:	5b                   	pop    %ebx
     9be:	5e                   	pop    %esi
     9bf:	5f                   	pop    %edi
     9c0:	5d                   	pop    %ebp
     9c1:	c3                   	ret    
     9c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     9c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     9cb:	8d 04 98             	lea    (%eax,%ebx,4),%eax
  cmd->argv[argc] = 0;
     9ce:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     9d5:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
     9dc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     9df:	83 c4 3c             	add    $0x3c,%esp
     9e2:	5b                   	pop    %ebx
     9e3:	5e                   	pop    %esi
     9e4:	5f                   	pop    %edi
     9e5:	5d                   	pop    %ebp
     9e6:	c3                   	ret    
      panic("syntax");
     9e7:	c7 04 24 98 14 00 00 	movl   $0x1498,(%esp)
     9ee:	e8 8d f7 ff ff       	call   180 <panic>
     9f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     9f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a00 <parsepipe>:
{
     a00:	55                   	push   %ebp
     a01:	89 e5                	mov    %esp,%ebp
     a03:	83 ec 28             	sub    $0x28,%esp
     a06:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     a09:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a0c:	89 75 f8             	mov    %esi,-0x8(%ebp)
     a0f:	8b 75 0c             	mov    0xc(%ebp),%esi
     a12:	89 7d fc             	mov    %edi,-0x4(%ebp)
  cmd = parseexec(ps, es);
     a15:	89 1c 24             	mov    %ebx,(%esp)
     a18:	89 74 24 04          	mov    %esi,0x4(%esp)
     a1c:	e8 bf fe ff ff       	call   8e0 <parseexec>
  if(peek(ps, es, "|")){
     a21:	b9 b2 14 00 00       	mov    $0x14b2,%ecx
     a26:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     a2a:	89 74 24 04          	mov    %esi,0x4(%esp)
     a2e:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseexec(ps, es);
     a31:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     a33:	e8 58 fd ff ff       	call   790 <peek>
     a38:	85 c0                	test   %eax,%eax
     a3a:	75 14                	jne    a50 <parsepipe+0x50>
}
     a3c:	89 f8                	mov    %edi,%eax
     a3e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     a41:	8b 75 f8             	mov    -0x8(%ebp),%esi
     a44:	8b 7d fc             	mov    -0x4(%ebp),%edi
     a47:	89 ec                	mov    %ebp,%esp
     a49:	5d                   	pop    %ebp
     a4a:	c3                   	ret    
     a4b:	90                   	nop
     a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
     a50:	31 d2                	xor    %edx,%edx
     a52:	31 c0                	xor    %eax,%eax
     a54:	89 54 24 08          	mov    %edx,0x8(%esp)
     a58:	89 74 24 04          	mov    %esi,0x4(%esp)
     a5c:	89 1c 24             	mov    %ebx,(%esp)
     a5f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     a63:	e8 c8 fb ff ff       	call   630 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a68:	89 74 24 04          	mov    %esi,0x4(%esp)
     a6c:	89 1c 24             	mov    %ebx,(%esp)
     a6f:	e8 8c ff ff ff       	call   a00 <parsepipe>
}
     a74:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a77:	89 7d 08             	mov    %edi,0x8(%ebp)
}
     a7a:	8b 75 f8             	mov    -0x8(%ebp),%esi
     a7d:	8b 7d fc             	mov    -0x4(%ebp),%edi
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a80:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     a83:	89 ec                	mov    %ebp,%esp
     a85:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a86:	e9 c5 fa ff ff       	jmp    550 <pipecmd>
     a8b:	90                   	nop
     a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a90 <parseline>:
{
     a90:	55                   	push   %ebp
     a91:	89 e5                	mov    %esp,%ebp
     a93:	57                   	push   %edi
     a94:	56                   	push   %esi
     a95:	53                   	push   %ebx
     a96:	83 ec 1c             	sub    $0x1c,%esp
     a99:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a9c:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parsepipe(ps, es);
     a9f:	89 1c 24             	mov    %ebx,(%esp)
     aa2:	89 74 24 04          	mov    %esi,0x4(%esp)
     aa6:	e8 55 ff ff ff       	call   a00 <parsepipe>
     aab:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     aad:	eb 23                	jmp    ad2 <parseline+0x42>
     aaf:	90                   	nop
    gettoken(ps, es, 0, 0);
     ab0:	31 c0                	xor    %eax,%eax
     ab2:	89 44 24 0c          	mov    %eax,0xc(%esp)
     ab6:	31 c0                	xor    %eax,%eax
     ab8:	89 44 24 08          	mov    %eax,0x8(%esp)
     abc:	89 74 24 04          	mov    %esi,0x4(%esp)
     ac0:	89 1c 24             	mov    %ebx,(%esp)
     ac3:	e8 68 fb ff ff       	call   630 <gettoken>
    cmd = backcmd(cmd);
     ac8:	89 3c 24             	mov    %edi,(%esp)
     acb:	e8 20 fb ff ff       	call   5f0 <backcmd>
     ad0:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     ad2:	b8 b4 14 00 00       	mov    $0x14b4,%eax
     ad7:	89 44 24 08          	mov    %eax,0x8(%esp)
     adb:	89 74 24 04          	mov    %esi,0x4(%esp)
     adf:	89 1c 24             	mov    %ebx,(%esp)
     ae2:	e8 a9 fc ff ff       	call   790 <peek>
     ae7:	85 c0                	test   %eax,%eax
     ae9:	75 c5                	jne    ab0 <parseline+0x20>
  if(peek(ps, es, ";")){
     aeb:	b9 b0 14 00 00       	mov    $0x14b0,%ecx
     af0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     af4:	89 74 24 04          	mov    %esi,0x4(%esp)
     af8:	89 1c 24             	mov    %ebx,(%esp)
     afb:	e8 90 fc ff ff       	call   790 <peek>
     b00:	85 c0                	test   %eax,%eax
     b02:	75 0c                	jne    b10 <parseline+0x80>
}
     b04:	83 c4 1c             	add    $0x1c,%esp
     b07:	89 f8                	mov    %edi,%eax
     b09:	5b                   	pop    %ebx
     b0a:	5e                   	pop    %esi
     b0b:	5f                   	pop    %edi
     b0c:	5d                   	pop    %ebp
     b0d:	c3                   	ret    
     b0e:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     b10:	31 d2                	xor    %edx,%edx
     b12:	31 c0                	xor    %eax,%eax
     b14:	89 54 24 08          	mov    %edx,0x8(%esp)
     b18:	89 74 24 04          	mov    %esi,0x4(%esp)
     b1c:	89 1c 24             	mov    %ebx,(%esp)
     b1f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b23:	e8 08 fb ff ff       	call   630 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     b28:	89 74 24 04          	mov    %esi,0x4(%esp)
     b2c:	89 1c 24             	mov    %ebx,(%esp)
     b2f:	e8 5c ff ff ff       	call   a90 <parseline>
     b34:	89 7d 08             	mov    %edi,0x8(%ebp)
     b37:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     b3a:	83 c4 1c             	add    $0x1c,%esp
     b3d:	5b                   	pop    %ebx
     b3e:	5e                   	pop    %esi
     b3f:	5f                   	pop    %edi
     b40:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
     b41:	e9 5a fa ff ff       	jmp    5a0 <listcmd>
     b46:	8d 76 00             	lea    0x0(%esi),%esi
     b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b50 <parseblock>:
{
     b50:	55                   	push   %ebp
  if(!peek(ps, es, "("))
     b51:	b8 96 14 00 00       	mov    $0x1496,%eax
{
     b56:	89 e5                	mov    %esp,%ebp
     b58:	83 ec 28             	sub    $0x28,%esp
     b5b:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     b5e:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b61:	89 75 f8             	mov    %esi,-0x8(%ebp)
     b64:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     b67:	89 44 24 08          	mov    %eax,0x8(%esp)
{
     b6b:	89 7d fc             	mov    %edi,-0x4(%ebp)
  if(!peek(ps, es, "("))
     b6e:	89 1c 24             	mov    %ebx,(%esp)
     b71:	89 74 24 04          	mov    %esi,0x4(%esp)
     b75:	e8 16 fc ff ff       	call   790 <peek>
     b7a:	85 c0                	test   %eax,%eax
     b7c:	74 74                	je     bf2 <parseblock+0xa2>
  gettoken(ps, es, 0, 0);
     b7e:	31 c9                	xor    %ecx,%ecx
     b80:	31 ff                	xor    %edi,%edi
     b82:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     b86:	89 7c 24 08          	mov    %edi,0x8(%esp)
     b8a:	89 74 24 04          	mov    %esi,0x4(%esp)
     b8e:	89 1c 24             	mov    %ebx,(%esp)
     b91:	e8 9a fa ff ff       	call   630 <gettoken>
  cmd = parseline(ps, es);
     b96:	89 74 24 04          	mov    %esi,0x4(%esp)
     b9a:	89 1c 24             	mov    %ebx,(%esp)
     b9d:	e8 ee fe ff ff       	call   a90 <parseline>
  if(!peek(ps, es, ")"))
     ba2:	89 74 24 04          	mov    %esi,0x4(%esp)
     ba6:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseline(ps, es);
     ba9:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     bab:	b8 d2 14 00 00       	mov    $0x14d2,%eax
     bb0:	89 44 24 08          	mov    %eax,0x8(%esp)
     bb4:	e8 d7 fb ff ff       	call   790 <peek>
     bb9:	85 c0                	test   %eax,%eax
     bbb:	74 41                	je     bfe <parseblock+0xae>
  gettoken(ps, es, 0, 0);
     bbd:	31 d2                	xor    %edx,%edx
     bbf:	31 c0                	xor    %eax,%eax
     bc1:	89 54 24 08          	mov    %edx,0x8(%esp)
     bc5:	89 74 24 04          	mov    %esi,0x4(%esp)
     bc9:	89 1c 24             	mov    %ebx,(%esp)
     bcc:	89 44 24 0c          	mov    %eax,0xc(%esp)
     bd0:	e8 5b fa ff ff       	call   630 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     bd5:	89 74 24 08          	mov    %esi,0x8(%esp)
     bd9:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     bdd:	89 3c 24             	mov    %edi,(%esp)
     be0:	e8 1b fc ff ff       	call   800 <parseredirs>
}
     be5:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     be8:	8b 75 f8             	mov    -0x8(%ebp),%esi
     beb:	8b 7d fc             	mov    -0x4(%ebp),%edi
     bee:	89 ec                	mov    %ebp,%esp
     bf0:	5d                   	pop    %ebp
     bf1:	c3                   	ret    
    panic("parseblock");
     bf2:	c7 04 24 b6 14 00 00 	movl   $0x14b6,(%esp)
     bf9:	e8 82 f5 ff ff       	call   180 <panic>
    panic("syntax - missing )");
     bfe:	c7 04 24 c1 14 00 00 	movl   $0x14c1,(%esp)
     c05:	e8 76 f5 ff ff       	call   180 <panic>
     c0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c10 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     c10:	55                   	push   %ebp
     c11:	89 e5                	mov    %esp,%ebp
     c13:	53                   	push   %ebx
     c14:	83 ec 14             	sub    $0x14,%esp
     c17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     c1a:	85 db                	test   %ebx,%ebx
     c1c:	74 1d                	je     c3b <nulterminate+0x2b>
    return 0;

  switch(cmd->type){
     c1e:	83 3b 05             	cmpl   $0x5,(%ebx)
     c21:	77 18                	ja     c3b <nulterminate+0x2b>
     c23:	8b 03                	mov    (%ebx),%eax
     c25:	ff 24 85 14 15 00 00 	jmp    *0x1514(,%eax,4)
     c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     c30:	8b 43 04             	mov    0x4(%ebx),%eax
     c33:	89 04 24             	mov    %eax,(%esp)
     c36:	e8 d5 ff ff ff       	call   c10 <nulterminate>
    break;
  }
  return cmd;
}
     c3b:	83 c4 14             	add    $0x14,%esp
     c3e:	89 d8                	mov    %ebx,%eax
     c40:	5b                   	pop    %ebx
     c41:	5d                   	pop    %ebp
     c42:	c3                   	ret    
     c43:	90                   	nop
     c44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->left);
     c48:	8b 43 04             	mov    0x4(%ebx),%eax
     c4b:	89 04 24             	mov    %eax,(%esp)
     c4e:	e8 bd ff ff ff       	call   c10 <nulterminate>
    nulterminate(lcmd->right);
     c53:	8b 43 08             	mov    0x8(%ebx),%eax
     c56:	89 04 24             	mov    %eax,(%esp)
     c59:	e8 b2 ff ff ff       	call   c10 <nulterminate>
}
     c5e:	83 c4 14             	add    $0x14,%esp
     c61:	89 d8                	mov    %ebx,%eax
     c63:	5b                   	pop    %ebx
     c64:	5d                   	pop    %ebp
     c65:	c3                   	ret    
     c66:	8d 76 00             	lea    0x0(%esi),%esi
     c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    for(i=0; ecmd->argv[i]; i++)
     c70:	8b 4b 04             	mov    0x4(%ebx),%ecx
     c73:	8d 43 08             	lea    0x8(%ebx),%eax
     c76:	85 c9                	test   %ecx,%ecx
     c78:	74 c1                	je     c3b <nulterminate+0x2b>
     c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     c80:	8b 50 24             	mov    0x24(%eax),%edx
     c83:	83 c0 04             	add    $0x4,%eax
     c86:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     c89:	8b 50 fc             	mov    -0x4(%eax),%edx
     c8c:	85 d2                	test   %edx,%edx
     c8e:	75 f0                	jne    c80 <nulterminate+0x70>
}
     c90:	83 c4 14             	add    $0x14,%esp
     c93:	89 d8                	mov    %ebx,%eax
     c95:	5b                   	pop    %ebx
     c96:	5d                   	pop    %ebp
     c97:	c3                   	ret    
     c98:	90                   	nop
     c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(rcmd->cmd);
     ca0:	8b 43 04             	mov    0x4(%ebx),%eax
     ca3:	89 04 24             	mov    %eax,(%esp)
     ca6:	e8 65 ff ff ff       	call   c10 <nulterminate>
    *rcmd->efile = 0;
     cab:	8b 43 0c             	mov    0xc(%ebx),%eax
     cae:	c6 00 00             	movb   $0x0,(%eax)
}
     cb1:	83 c4 14             	add    $0x14,%esp
     cb4:	89 d8                	mov    %ebx,%eax
     cb6:	5b                   	pop    %ebx
     cb7:	5d                   	pop    %ebp
     cb8:	c3                   	ret    
     cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cc0 <parsecmd>:
{
     cc0:	55                   	push   %ebp
     cc1:	89 e5                	mov    %esp,%ebp
     cc3:	56                   	push   %esi
     cc4:	53                   	push   %ebx
     cc5:	83 ec 10             	sub    $0x10,%esp
  es = s + strlen(s);
     cc8:	8b 5d 08             	mov    0x8(%ebp),%ebx
     ccb:	89 1c 24             	mov    %ebx,(%esp)
     cce:	e8 cd 00 00 00       	call   da0 <strlen>
     cd3:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     cd5:	8d 45 08             	lea    0x8(%ebp),%eax
     cd8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     cdc:	89 04 24             	mov    %eax,(%esp)
     cdf:	e8 ac fd ff ff       	call   a90 <parseline>
  peek(&s, es, "");
     ce4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  cmd = parseline(&s, es);
     ce8:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     cea:	b8 5b 14 00 00       	mov    $0x145b,%eax
     cef:	89 44 24 08          	mov    %eax,0x8(%esp)
     cf3:	8d 45 08             	lea    0x8(%ebp),%eax
     cf6:	89 04 24             	mov    %eax,(%esp)
     cf9:	e8 92 fa ff ff       	call   790 <peek>
  if(s != es){
     cfe:	8b 45 08             	mov    0x8(%ebp),%eax
     d01:	39 d8                	cmp    %ebx,%eax
     d03:	75 11                	jne    d16 <parsecmd+0x56>
  nulterminate(cmd);
     d05:	89 34 24             	mov    %esi,(%esp)
     d08:	e8 03 ff ff ff       	call   c10 <nulterminate>
}
     d0d:	83 c4 10             	add    $0x10,%esp
     d10:	89 f0                	mov    %esi,%eax
     d12:	5b                   	pop    %ebx
     d13:	5e                   	pop    %esi
     d14:	5d                   	pop    %ebp
     d15:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     d16:	89 44 24 08          	mov    %eax,0x8(%esp)
     d1a:	c7 44 24 04 d4 14 00 	movl   $0x14d4,0x4(%esp)
     d21:	00 
     d22:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     d29:	e8 92 03 00 00       	call   10c0 <printf>
    panic("syntax");
     d2e:	c7 04 24 98 14 00 00 	movl   $0x1498,(%esp)
     d35:	e8 46 f4 ff ff       	call   180 <panic>
     d3a:	66 90                	xchg   %ax,%ax
     d3c:	66 90                	xchg   %ax,%ax
     d3e:	66 90                	xchg   %ax,%ax

00000d40 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     d40:	55                   	push   %ebp
     d41:	89 e5                	mov    %esp,%ebp
     d43:	8b 45 08             	mov    0x8(%ebp),%eax
     d46:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     d49:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     d4a:	89 c2                	mov    %eax,%edx
     d4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d50:	41                   	inc    %ecx
     d51:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     d55:	42                   	inc    %edx
     d56:	84 db                	test   %bl,%bl
     d58:	88 5a ff             	mov    %bl,-0x1(%edx)
     d5b:	75 f3                	jne    d50 <strcpy+0x10>
    ;
  return os;
}
     d5d:	5b                   	pop    %ebx
     d5e:	5d                   	pop    %ebp
     d5f:	c3                   	ret    

00000d60 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     d60:	55                   	push   %ebp
     d61:	89 e5                	mov    %esp,%ebp
     d63:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d66:	53                   	push   %ebx
     d67:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*p && *p == *q)
     d6a:	0f b6 01             	movzbl (%ecx),%eax
     d6d:	0f b6 13             	movzbl (%ebx),%edx
     d70:	84 c0                	test   %al,%al
     d72:	75 18                	jne    d8c <strcmp+0x2c>
     d74:	eb 22                	jmp    d98 <strcmp+0x38>
     d76:	8d 76 00             	lea    0x0(%esi),%esi
     d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     d80:	41                   	inc    %ecx
  while(*p && *p == *q)
     d81:	0f b6 01             	movzbl (%ecx),%eax
    p++, q++;
     d84:	43                   	inc    %ebx
     d85:	0f b6 13             	movzbl (%ebx),%edx
  while(*p && *p == *q)
     d88:	84 c0                	test   %al,%al
     d8a:	74 0c                	je     d98 <strcmp+0x38>
     d8c:	38 d0                	cmp    %dl,%al
     d8e:	74 f0                	je     d80 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
}
     d90:	5b                   	pop    %ebx
  return (uchar)*p - (uchar)*q;
     d91:	29 d0                	sub    %edx,%eax
}
     d93:	5d                   	pop    %ebp
     d94:	c3                   	ret    
     d95:	8d 76 00             	lea    0x0(%esi),%esi
     d98:	5b                   	pop    %ebx
     d99:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     d9b:	29 d0                	sub    %edx,%eax
}
     d9d:	5d                   	pop    %ebp
     d9e:	c3                   	ret    
     d9f:	90                   	nop

00000da0 <strlen>:

uint
strlen(const char *s)
{
     da0:	55                   	push   %ebp
     da1:	89 e5                	mov    %esp,%ebp
     da3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     da6:	80 39 00             	cmpb   $0x0,(%ecx)
     da9:	74 15                	je     dc0 <strlen+0x20>
     dab:	31 d2                	xor    %edx,%edx
     dad:	8d 76 00             	lea    0x0(%esi),%esi
     db0:	42                   	inc    %edx
     db1:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     db5:	89 d0                	mov    %edx,%eax
     db7:	75 f7                	jne    db0 <strlen+0x10>
    ;
  return n;
}
     db9:	5d                   	pop    %ebp
     dba:	c3                   	ret    
     dbb:	90                   	nop
     dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(n = 0; s[n]; n++)
     dc0:	31 c0                	xor    %eax,%eax
}
     dc2:	5d                   	pop    %ebp
     dc3:	c3                   	ret    
     dc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     dca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000dd0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     dd0:	55                   	push   %ebp
     dd1:	89 e5                	mov    %esp,%ebp
     dd3:	8b 55 08             	mov    0x8(%ebp),%edx
     dd6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     dd7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     dda:	8b 45 0c             	mov    0xc(%ebp),%eax
     ddd:	89 d7                	mov    %edx,%edi
     ddf:	fc                   	cld    
     de0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     de2:	5f                   	pop    %edi
     de3:	89 d0                	mov    %edx,%eax
     de5:	5d                   	pop    %ebp
     de6:	c3                   	ret    
     de7:	89 f6                	mov    %esi,%esi
     de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000df0 <strchr>:

char*
strchr(const char *s, char c)
{
     df0:	55                   	push   %ebp
     df1:	89 e5                	mov    %esp,%ebp
     df3:	8b 45 08             	mov    0x8(%ebp),%eax
     df6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     dfa:	0f b6 10             	movzbl (%eax),%edx
     dfd:	84 d2                	test   %dl,%dl
     dff:	74 1b                	je     e1c <strchr+0x2c>
    if(*s == c)
     e01:	38 d1                	cmp    %dl,%cl
     e03:	75 0f                	jne    e14 <strchr+0x24>
     e05:	eb 17                	jmp    e1e <strchr+0x2e>
     e07:	89 f6                	mov    %esi,%esi
     e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     e10:	38 ca                	cmp    %cl,%dl
     e12:	74 0a                	je     e1e <strchr+0x2e>
  for(; *s; s++)
     e14:	40                   	inc    %eax
     e15:	0f b6 10             	movzbl (%eax),%edx
     e18:	84 d2                	test   %dl,%dl
     e1a:	75 f4                	jne    e10 <strchr+0x20>
      return (char*)s;
  return 0;
     e1c:	31 c0                	xor    %eax,%eax
}
     e1e:	5d                   	pop    %ebp
     e1f:	c3                   	ret    

00000e20 <gets>:

char*
gets(char *buf, int max)
{
     e20:	55                   	push   %ebp
     e21:	89 e5                	mov    %esp,%ebp
     e23:	57                   	push   %edi
     e24:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e25:	31 f6                	xor    %esi,%esi
{
     e27:	53                   	push   %ebx
     e28:	83 ec 3c             	sub    $0x3c,%esp
     e2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    cc = read(0, &c, 1);
     e2e:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
     e31:	eb 32                	jmp    e65 <gets+0x45>
     e33:	90                   	nop
     e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cc = read(0, &c, 1);
     e38:	ba 01 00 00 00       	mov    $0x1,%edx
     e3d:	89 54 24 08          	mov    %edx,0x8(%esp)
     e41:	89 7c 24 04          	mov    %edi,0x4(%esp)
     e45:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e4c:	e8 2f 01 00 00       	call   f80 <read>
    if(cc < 1)
     e51:	85 c0                	test   %eax,%eax
     e53:	7e 19                	jle    e6e <gets+0x4e>
      break;
    buf[i++] = c;
     e55:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     e59:	43                   	inc    %ebx
     e5a:	88 43 ff             	mov    %al,-0x1(%ebx)
    if(c == '\n' || c == '\r')
     e5d:	3c 0a                	cmp    $0xa,%al
     e5f:	74 1f                	je     e80 <gets+0x60>
     e61:	3c 0d                	cmp    $0xd,%al
     e63:	74 1b                	je     e80 <gets+0x60>
  for(i=0; i+1 < max; ){
     e65:	46                   	inc    %esi
     e66:	3b 75 0c             	cmp    0xc(%ebp),%esi
     e69:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
     e6c:	7c ca                	jl     e38 <gets+0x18>
      break;
  }
  buf[i] = '\0';
     e6e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     e71:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
}
     e74:	8b 45 08             	mov    0x8(%ebp),%eax
     e77:	83 c4 3c             	add    $0x3c,%esp
     e7a:	5b                   	pop    %ebx
     e7b:	5e                   	pop    %esi
     e7c:	5f                   	pop    %edi
     e7d:	5d                   	pop    %ebp
     e7e:	c3                   	ret    
     e7f:	90                   	nop
     e80:	8b 45 08             	mov    0x8(%ebp),%eax
     e83:	01 c6                	add    %eax,%esi
     e85:	89 75 d4             	mov    %esi,-0x2c(%ebp)
     e88:	eb e4                	jmp    e6e <gets+0x4e>
     e8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000e90 <stat>:

int
stat(const char *n, struct stat *st)
{
     e90:	55                   	push   %ebp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     e91:	31 c0                	xor    %eax,%eax
{
     e93:	89 e5                	mov    %esp,%ebp
     e95:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
     e98:	89 44 24 04          	mov    %eax,0x4(%esp)
     e9c:	8b 45 08             	mov    0x8(%ebp),%eax
{
     e9f:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     ea2:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
     ea5:	89 04 24             	mov    %eax,(%esp)
     ea8:	e8 fb 00 00 00       	call   fa8 <open>
  if(fd < 0)
     ead:	85 c0                	test   %eax,%eax
     eaf:	78 2f                	js     ee0 <stat+0x50>
     eb1:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
     eb3:	8b 45 0c             	mov    0xc(%ebp),%eax
     eb6:	89 1c 24             	mov    %ebx,(%esp)
     eb9:	89 44 24 04          	mov    %eax,0x4(%esp)
     ebd:	e8 fe 00 00 00       	call   fc0 <fstat>
  close(fd);
     ec2:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     ec5:	89 c6                	mov    %eax,%esi
  close(fd);
     ec7:	e8 c4 00 00 00       	call   f90 <close>
  return r;
}
     ecc:	89 f0                	mov    %esi,%eax
     ece:	8b 5d f8             	mov    -0x8(%ebp),%ebx
     ed1:	8b 75 fc             	mov    -0x4(%ebp),%esi
     ed4:	89 ec                	mov    %ebp,%esp
     ed6:	5d                   	pop    %ebp
     ed7:	c3                   	ret    
     ed8:	90                   	nop
     ed9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
     ee0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     ee5:	eb e5                	jmp    ecc <stat+0x3c>
     ee7:	89 f6                	mov    %esi,%esi
     ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ef0 <atoi>:

int
atoi(const char *s)
{
     ef0:	55                   	push   %ebp
     ef1:	89 e5                	mov    %esp,%ebp
     ef3:	8b 4d 08             	mov    0x8(%ebp),%ecx
     ef6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     ef7:	0f be 11             	movsbl (%ecx),%edx
     efa:	88 d0                	mov    %dl,%al
     efc:	2c 30                	sub    $0x30,%al
     efe:	3c 09                	cmp    $0x9,%al
  n = 0;
     f00:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
     f05:	77 1e                	ja     f25 <atoi+0x35>
     f07:	89 f6                	mov    %esi,%esi
     f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     f10:	41                   	inc    %ecx
     f11:	8d 04 80             	lea    (%eax,%eax,4),%eax
     f14:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
     f18:	0f be 11             	movsbl (%ecx),%edx
     f1b:	88 d3                	mov    %dl,%bl
     f1d:	80 eb 30             	sub    $0x30,%bl
     f20:	80 fb 09             	cmp    $0x9,%bl
     f23:	76 eb                	jbe    f10 <atoi+0x20>
  return n;
}
     f25:	5b                   	pop    %ebx
     f26:	5d                   	pop    %ebp
     f27:	c3                   	ret    
     f28:	90                   	nop
     f29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f30 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     f30:	55                   	push   %ebp
     f31:	89 e5                	mov    %esp,%ebp
     f33:	56                   	push   %esi
     f34:	8b 45 08             	mov    0x8(%ebp),%eax
     f37:	53                   	push   %ebx
     f38:	8b 5d 10             	mov    0x10(%ebp),%ebx
     f3b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     f3e:	85 db                	test   %ebx,%ebx
     f40:	7e 1a                	jle    f5c <memmove+0x2c>
     f42:	31 d2                	xor    %edx,%edx
     f44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     f4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *dst++ = *src++;
     f50:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     f54:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     f57:	42                   	inc    %edx
  while(n-- > 0)
     f58:	39 d3                	cmp    %edx,%ebx
     f5a:	75 f4                	jne    f50 <memmove+0x20>
  return vdst;
}
     f5c:	5b                   	pop    %ebx
     f5d:	5e                   	pop    %esi
     f5e:	5d                   	pop    %ebp
     f5f:	c3                   	ret    

00000f60 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     f60:	b8 01 00 00 00       	mov    $0x1,%eax
     f65:	cd 40                	int    $0x40
     f67:	c3                   	ret    

00000f68 <exit>:
SYSCALL(exit)
     f68:	b8 02 00 00 00       	mov    $0x2,%eax
     f6d:	cd 40                	int    $0x40
     f6f:	c3                   	ret    

00000f70 <wait>:
SYSCALL(wait)
     f70:	b8 03 00 00 00       	mov    $0x3,%eax
     f75:	cd 40                	int    $0x40
     f77:	c3                   	ret    

00000f78 <pipe>:
SYSCALL(pipe)
     f78:	b8 04 00 00 00       	mov    $0x4,%eax
     f7d:	cd 40                	int    $0x40
     f7f:	c3                   	ret    

00000f80 <read>:
SYSCALL(read)
     f80:	b8 05 00 00 00       	mov    $0x5,%eax
     f85:	cd 40                	int    $0x40
     f87:	c3                   	ret    

00000f88 <write>:
SYSCALL(write)
     f88:	b8 10 00 00 00       	mov    $0x10,%eax
     f8d:	cd 40                	int    $0x40
     f8f:	c3                   	ret    

00000f90 <close>:
SYSCALL(close)
     f90:	b8 15 00 00 00       	mov    $0x15,%eax
     f95:	cd 40                	int    $0x40
     f97:	c3                   	ret    

00000f98 <kill>:
SYSCALL(kill)
     f98:	b8 06 00 00 00       	mov    $0x6,%eax
     f9d:	cd 40                	int    $0x40
     f9f:	c3                   	ret    

00000fa0 <exec>:
SYSCALL(exec)
     fa0:	b8 07 00 00 00       	mov    $0x7,%eax
     fa5:	cd 40                	int    $0x40
     fa7:	c3                   	ret    

00000fa8 <open>:
SYSCALL(open)
     fa8:	b8 0f 00 00 00       	mov    $0xf,%eax
     fad:	cd 40                	int    $0x40
     faf:	c3                   	ret    

00000fb0 <mknod>:
SYSCALL(mknod)
     fb0:	b8 11 00 00 00       	mov    $0x11,%eax
     fb5:	cd 40                	int    $0x40
     fb7:	c3                   	ret    

00000fb8 <unlink>:
SYSCALL(unlink)
     fb8:	b8 12 00 00 00       	mov    $0x12,%eax
     fbd:	cd 40                	int    $0x40
     fbf:	c3                   	ret    

00000fc0 <fstat>:
SYSCALL(fstat)
     fc0:	b8 08 00 00 00       	mov    $0x8,%eax
     fc5:	cd 40                	int    $0x40
     fc7:	c3                   	ret    

00000fc8 <link>:
SYSCALL(link)
     fc8:	b8 13 00 00 00       	mov    $0x13,%eax
     fcd:	cd 40                	int    $0x40
     fcf:	c3                   	ret    

00000fd0 <mkdir>:
SYSCALL(mkdir)
     fd0:	b8 14 00 00 00       	mov    $0x14,%eax
     fd5:	cd 40                	int    $0x40
     fd7:	c3                   	ret    

00000fd8 <chdir>:
SYSCALL(chdir)
     fd8:	b8 09 00 00 00       	mov    $0x9,%eax
     fdd:	cd 40                	int    $0x40
     fdf:	c3                   	ret    

00000fe0 <dup>:
SYSCALL(dup)
     fe0:	b8 0a 00 00 00       	mov    $0xa,%eax
     fe5:	cd 40                	int    $0x40
     fe7:	c3                   	ret    

00000fe8 <getpid>:
SYSCALL(getpid)
     fe8:	b8 0b 00 00 00       	mov    $0xb,%eax
     fed:	cd 40                	int    $0x40
     fef:	c3                   	ret    

00000ff0 <sbrk>:
SYSCALL(sbrk)
     ff0:	b8 0c 00 00 00       	mov    $0xc,%eax
     ff5:	cd 40                	int    $0x40
     ff7:	c3                   	ret    

00000ff8 <sleep>:
SYSCALL(sleep)
     ff8:	b8 0d 00 00 00       	mov    $0xd,%eax
     ffd:	cd 40                	int    $0x40
     fff:	c3                   	ret    

00001000 <uptime>:
SYSCALL(uptime)
    1000:	b8 0e 00 00 00       	mov    $0xe,%eax
    1005:	cd 40                	int    $0x40
    1007:	c3                   	ret    

00001008 <detach>:
SYSCALL(detach)
    1008:	b8 16 00 00 00       	mov    $0x16,%eax
    100d:	cd 40                	int    $0x40
    100f:	c3                   	ret    

00001010 <priority>:
SYSCALL(priority)
    1010:	b8 17 00 00 00       	mov    $0x17,%eax
    1015:	cd 40                	int    $0x40
    1017:	c3                   	ret    
    1018:	66 90                	xchg   %ax,%ax
    101a:	66 90                	xchg   %ax,%ax
    101c:	66 90                	xchg   %ax,%ax
    101e:	66 90                	xchg   %ax,%ax

00001020 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1020:	55                   	push   %ebp
    1021:	89 e5                	mov    %esp,%ebp
    1023:	57                   	push   %edi
    1024:	56                   	push   %esi
    1025:	53                   	push   %ebx
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1026:	89 d3                	mov    %edx,%ebx
    1028:	c1 eb 1f             	shr    $0x1f,%ebx
{
    102b:	83 ec 4c             	sub    $0x4c,%esp
  if(sgn && xx < 0){
    102e:	84 db                	test   %bl,%bl
{
    1030:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1033:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1035:	74 79                	je     10b0 <printint+0x90>
    1037:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    103b:	74 73                	je     10b0 <printint+0x90>
    neg = 1;
    x = -xx;
    103d:	f7 d8                	neg    %eax
    neg = 1;
    103f:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1046:	31 f6                	xor    %esi,%esi
    1048:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    104b:	eb 05                	jmp    1052 <printint+0x32>
    104d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1050:	89 fe                	mov    %edi,%esi
    1052:	31 d2                	xor    %edx,%edx
    1054:	f7 f1                	div    %ecx
    1056:	8d 7e 01             	lea    0x1(%esi),%edi
    1059:	0f b6 92 34 15 00 00 	movzbl 0x1534(%edx),%edx
  }while((x /= base) != 0);
    1060:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1062:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1065:	75 e9                	jne    1050 <printint+0x30>
  if(neg)
    1067:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    106a:	85 d2                	test   %edx,%edx
    106c:	74 08                	je     1076 <printint+0x56>
    buf[i++] = '-';
    106e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1073:	8d 7e 02             	lea    0x2(%esi),%edi
    1076:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    107a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    107d:	8d 76 00             	lea    0x0(%esi),%esi
    1080:	0f b6 06             	movzbl (%esi),%eax
    1083:	4e                   	dec    %esi
  write(fd, &c, 1);
    1084:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1088:	89 3c 24             	mov    %edi,(%esp)
    108b:	88 45 d7             	mov    %al,-0x29(%ebp)
    108e:	b8 01 00 00 00       	mov    $0x1,%eax
    1093:	89 44 24 08          	mov    %eax,0x8(%esp)
    1097:	e8 ec fe ff ff       	call   f88 <write>

  while(--i >= 0)
    109c:	39 de                	cmp    %ebx,%esi
    109e:	75 e0                	jne    1080 <printint+0x60>
    putc(fd, buf[i]);
}
    10a0:	83 c4 4c             	add    $0x4c,%esp
    10a3:	5b                   	pop    %ebx
    10a4:	5e                   	pop    %esi
    10a5:	5f                   	pop    %edi
    10a6:	5d                   	pop    %ebp
    10a7:	c3                   	ret    
    10a8:	90                   	nop
    10a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    10b0:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    10b7:	eb 8d                	jmp    1046 <printint+0x26>
    10b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000010c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	57                   	push   %edi
    10c4:	56                   	push   %esi
    10c5:	53                   	push   %ebx
    10c6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    10c9:	8b 75 0c             	mov    0xc(%ebp),%esi
    10cc:	0f b6 1e             	movzbl (%esi),%ebx
    10cf:	84 db                	test   %bl,%bl
    10d1:	0f 84 d1 00 00 00    	je     11a8 <printf+0xe8>
  state = 0;
    10d7:	31 ff                	xor    %edi,%edi
    10d9:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
    10da:	8d 45 10             	lea    0x10(%ebp),%eax
  write(fd, &c, 1);
    10dd:	89 fa                	mov    %edi,%edx
    10df:	8b 7d 08             	mov    0x8(%ebp),%edi
  ap = (uint*)(void*)&fmt + 1;
    10e2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    10e5:	eb 41                	jmp    1128 <printf+0x68>
    10e7:	89 f6                	mov    %esi,%esi
    10e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    10f0:	83 f8 25             	cmp    $0x25,%eax
    10f3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    10f6:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    10fb:	74 1e                	je     111b <printf+0x5b>
  write(fd, &c, 1);
    10fd:	b8 01 00 00 00       	mov    $0x1,%eax
    1102:	89 44 24 08          	mov    %eax,0x8(%esp)
    1106:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1109:	89 44 24 04          	mov    %eax,0x4(%esp)
    110d:	89 3c 24             	mov    %edi,(%esp)
    1110:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1113:	e8 70 fe ff ff       	call   f88 <write>
    1118:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    111b:	46                   	inc    %esi
  for(i = 0; fmt[i]; i++){
    111c:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1120:	84 db                	test   %bl,%bl
    1122:	0f 84 80 00 00 00    	je     11a8 <printf+0xe8>
    if(state == 0){
    1128:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    112a:	0f be cb             	movsbl %bl,%ecx
    112d:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1130:	74 be                	je     10f0 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1132:	83 fa 25             	cmp    $0x25,%edx
    1135:	75 e4                	jne    111b <printf+0x5b>
      if(c == 'd'){
    1137:	83 f8 64             	cmp    $0x64,%eax
    113a:	0f 84 f0 00 00 00    	je     1230 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1140:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1146:	83 f9 70             	cmp    $0x70,%ecx
    1149:	74 65                	je     11b0 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    114b:	83 f8 73             	cmp    $0x73,%eax
    114e:	0f 84 8c 00 00 00    	je     11e0 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1154:	83 f8 63             	cmp    $0x63,%eax
    1157:	0f 84 13 01 00 00    	je     1270 <printf+0x1b0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    115d:	83 f8 25             	cmp    $0x25,%eax
    1160:	0f 84 e2 00 00 00    	je     1248 <printf+0x188>
  write(fd, &c, 1);
    1166:	b8 01 00 00 00       	mov    $0x1,%eax
    116b:	46                   	inc    %esi
    116c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1170:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1173:	89 44 24 04          	mov    %eax,0x4(%esp)
    1177:	89 3c 24             	mov    %edi,(%esp)
    117a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    117e:	e8 05 fe ff ff       	call   f88 <write>
    1183:	ba 01 00 00 00       	mov    $0x1,%edx
    1188:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    118b:	89 54 24 08          	mov    %edx,0x8(%esp)
    118f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1193:	89 3c 24             	mov    %edi,(%esp)
    1196:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    1199:	e8 ea fd ff ff       	call   f88 <write>
  for(i = 0; fmt[i]; i++){
    119e:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    11a2:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    11a4:	84 db                	test   %bl,%bl
    11a6:	75 80                	jne    1128 <printf+0x68>
    }
  }
}
    11a8:	83 c4 3c             	add    $0x3c,%esp
    11ab:	5b                   	pop    %ebx
    11ac:	5e                   	pop    %esi
    11ad:	5f                   	pop    %edi
    11ae:	5d                   	pop    %ebp
    11af:	c3                   	ret    
        printint(fd, *ap, 16, 0);
    11b0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11b7:	b9 10 00 00 00       	mov    $0x10,%ecx
    11bc:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    11bf:	89 f8                	mov    %edi,%eax
    11c1:	8b 13                	mov    (%ebx),%edx
    11c3:	e8 58 fe ff ff       	call   1020 <printint>
        ap++;
    11c8:	89 d8                	mov    %ebx,%eax
      state = 0;
    11ca:	31 d2                	xor    %edx,%edx
        ap++;
    11cc:	83 c0 04             	add    $0x4,%eax
    11cf:	89 45 d0             	mov    %eax,-0x30(%ebp)
    11d2:	e9 44 ff ff ff       	jmp    111b <printf+0x5b>
    11d7:	89 f6                	mov    %esi,%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    11e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    11e3:	8b 10                	mov    (%eax),%edx
        ap++;
    11e5:	83 c0 04             	add    $0x4,%eax
    11e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    11eb:	85 d2                	test   %edx,%edx
    11ed:	0f 84 aa 00 00 00    	je     129d <printf+0x1dd>
        while(*s != 0){
    11f3:	0f b6 02             	movzbl (%edx),%eax
        s = (char*)*ap;
    11f6:	89 d3                	mov    %edx,%ebx
        while(*s != 0){
    11f8:	84 c0                	test   %al,%al
    11fa:	74 27                	je     1223 <printf+0x163>
    11fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1200:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1203:	b8 01 00 00 00       	mov    $0x1,%eax
          s++;
    1208:	43                   	inc    %ebx
  write(fd, &c, 1);
    1209:	89 44 24 08          	mov    %eax,0x8(%esp)
    120d:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1210:	89 44 24 04          	mov    %eax,0x4(%esp)
    1214:	89 3c 24             	mov    %edi,(%esp)
    1217:	e8 6c fd ff ff       	call   f88 <write>
        while(*s != 0){
    121c:	0f b6 03             	movzbl (%ebx),%eax
    121f:	84 c0                	test   %al,%al
    1221:	75 dd                	jne    1200 <printf+0x140>
      state = 0;
    1223:	31 d2                	xor    %edx,%edx
    1225:	e9 f1 fe ff ff       	jmp    111b <printf+0x5b>
    122a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1230:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1237:	b9 0a 00 00 00       	mov    $0xa,%ecx
    123c:	e9 7b ff ff ff       	jmp    11bc <printf+0xfc>
    1241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1248:	b9 01 00 00 00       	mov    $0x1,%ecx
    124d:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1250:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1254:	89 44 24 04          	mov    %eax,0x4(%esp)
    1258:	89 3c 24             	mov    %edi,(%esp)
    125b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    125e:	e8 25 fd ff ff       	call   f88 <write>
      state = 0;
    1263:	31 d2                	xor    %edx,%edx
    1265:	e9 b1 fe ff ff       	jmp    111b <printf+0x5b>
    126a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, *ap);
    1270:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1273:	8b 03                	mov    (%ebx),%eax
        ap++;
    1275:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    1278:	89 3c 24             	mov    %edi,(%esp)
        putc(fd, *ap);
    127b:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    127e:	b8 01 00 00 00       	mov    $0x1,%eax
    1283:	89 44 24 08          	mov    %eax,0x8(%esp)
    1287:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    128a:	89 44 24 04          	mov    %eax,0x4(%esp)
    128e:	e8 f5 fc ff ff       	call   f88 <write>
      state = 0;
    1293:	31 d2                	xor    %edx,%edx
        ap++;
    1295:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1298:	e9 7e fe ff ff       	jmp    111b <printf+0x5b>
          s = "(null)";
    129d:	bb 2c 15 00 00       	mov    $0x152c,%ebx
        while(*s != 0){
    12a2:	b0 28                	mov    $0x28,%al
    12a4:	e9 57 ff ff ff       	jmp    1200 <printf+0x140>
    12a9:	66 90                	xchg   %ax,%ax
    12ab:	66 90                	xchg   %ax,%ax
    12ad:	66 90                	xchg   %ax,%ax
    12af:	90                   	nop

000012b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12b1:	a1 64 1b 00 00       	mov    0x1b64,%eax
{
    12b6:	89 e5                	mov    %esp,%ebp
    12b8:	57                   	push   %edi
    12b9:	56                   	push   %esi
    12ba:	53                   	push   %ebx
    12bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    12be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    12c1:	eb 0d                	jmp    12d0 <free+0x20>
    12c3:	90                   	nop
    12c4:	90                   	nop
    12c5:	90                   	nop
    12c6:	90                   	nop
    12c7:	90                   	nop
    12c8:	90                   	nop
    12c9:	90                   	nop
    12ca:	90                   	nop
    12cb:	90                   	nop
    12cc:	90                   	nop
    12cd:	90                   	nop
    12ce:	90                   	nop
    12cf:	90                   	nop
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12d0:	39 c8                	cmp    %ecx,%eax
    12d2:	8b 10                	mov    (%eax),%edx
    12d4:	73 32                	jae    1308 <free+0x58>
    12d6:	39 d1                	cmp    %edx,%ecx
    12d8:	72 04                	jb     12de <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12da:	39 d0                	cmp    %edx,%eax
    12dc:	72 32                	jb     1310 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
    12de:	8b 73 fc             	mov    -0x4(%ebx),%esi
    12e1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    12e4:	39 fa                	cmp    %edi,%edx
    12e6:	74 30                	je     1318 <free+0x68>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    12e8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    12eb:	8b 50 04             	mov    0x4(%eax),%edx
    12ee:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    12f1:	39 f1                	cmp    %esi,%ecx
    12f3:	74 3c                	je     1331 <free+0x81>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    12f5:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    12f7:	5b                   	pop    %ebx
  freep = p;
    12f8:	a3 64 1b 00 00       	mov    %eax,0x1b64
}
    12fd:	5e                   	pop    %esi
    12fe:	5f                   	pop    %edi
    12ff:	5d                   	pop    %ebp
    1300:	c3                   	ret    
    1301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1308:	39 d0                	cmp    %edx,%eax
    130a:	72 04                	jb     1310 <free+0x60>
    130c:	39 d1                	cmp    %edx,%ecx
    130e:	72 ce                	jb     12de <free+0x2e>
{
    1310:	89 d0                	mov    %edx,%eax
    1312:	eb bc                	jmp    12d0 <free+0x20>
    1314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1318:	8b 7a 04             	mov    0x4(%edx),%edi
    131b:	01 fe                	add    %edi,%esi
    131d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1320:	8b 10                	mov    (%eax),%edx
    1322:	8b 12                	mov    (%edx),%edx
    1324:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1327:	8b 50 04             	mov    0x4(%eax),%edx
    132a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    132d:	39 f1                	cmp    %esi,%ecx
    132f:	75 c4                	jne    12f5 <free+0x45>
    p->s.size += bp->s.size;
    1331:	8b 4b fc             	mov    -0x4(%ebx),%ecx
  freep = p;
    1334:	a3 64 1b 00 00       	mov    %eax,0x1b64
    p->s.size += bp->s.size;
    1339:	01 ca                	add    %ecx,%edx
    133b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    133e:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1341:	89 10                	mov    %edx,(%eax)
}
    1343:	5b                   	pop    %ebx
    1344:	5e                   	pop    %esi
    1345:	5f                   	pop    %edi
    1346:	5d                   	pop    %ebp
    1347:	c3                   	ret    
    1348:	90                   	nop
    1349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001350 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	57                   	push   %edi
    1354:	56                   	push   %esi
    1355:	53                   	push   %ebx
    1356:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1359:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    135c:	8b 15 64 1b 00 00    	mov    0x1b64,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1362:	8d 78 07             	lea    0x7(%eax),%edi
    1365:	c1 ef 03             	shr    $0x3,%edi
    1368:	47                   	inc    %edi
  if((prevp = freep) == 0){
    1369:	85 d2                	test   %edx,%edx
    136b:	0f 84 8f 00 00 00    	je     1400 <malloc+0xb0>
    1371:	8b 02                	mov    (%edx),%eax
    1373:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1376:	39 cf                	cmp    %ecx,%edi
    1378:	76 66                	jbe    13e0 <malloc+0x90>
    137a:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1380:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1385:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    1388:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    138f:	eb 10                	jmp    13a1 <malloc+0x51>
    1391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1398:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    139a:	8b 48 04             	mov    0x4(%eax),%ecx
    139d:	39 f9                	cmp    %edi,%ecx
    139f:	73 3f                	jae    13e0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    13a1:	39 05 64 1b 00 00    	cmp    %eax,0x1b64
    13a7:	89 c2                	mov    %eax,%edx
    13a9:	75 ed                	jne    1398 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    13ab:	89 34 24             	mov    %esi,(%esp)
    13ae:	e8 3d fc ff ff       	call   ff0 <sbrk>
  if(p == (char*)-1)
    13b3:	83 f8 ff             	cmp    $0xffffffff,%eax
    13b6:	74 18                	je     13d0 <malloc+0x80>
  hp->s.size = nu;
    13b8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    13bb:	83 c0 08             	add    $0x8,%eax
    13be:	89 04 24             	mov    %eax,(%esp)
    13c1:	e8 ea fe ff ff       	call   12b0 <free>
  return freep;
    13c6:	8b 15 64 1b 00 00    	mov    0x1b64,%edx
      if((p = morecore(nunits)) == 0)
    13cc:	85 d2                	test   %edx,%edx
    13ce:	75 c8                	jne    1398 <malloc+0x48>
        return 0;
  }
}
    13d0:	83 c4 1c             	add    $0x1c,%esp
        return 0;
    13d3:	31 c0                	xor    %eax,%eax
}
    13d5:	5b                   	pop    %ebx
    13d6:	5e                   	pop    %esi
    13d7:	5f                   	pop    %edi
    13d8:	5d                   	pop    %ebp
    13d9:	c3                   	ret    
    13da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    13e0:	39 cf                	cmp    %ecx,%edi
    13e2:	74 4c                	je     1430 <malloc+0xe0>
        p->s.size -= nunits;
    13e4:	29 f9                	sub    %edi,%ecx
    13e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    13e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    13ec:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    13ef:	89 15 64 1b 00 00    	mov    %edx,0x1b64
}
    13f5:	83 c4 1c             	add    $0x1c,%esp
      return (void*)(p + 1);
    13f8:	83 c0 08             	add    $0x8,%eax
}
    13fb:	5b                   	pop    %ebx
    13fc:	5e                   	pop    %esi
    13fd:	5f                   	pop    %edi
    13fe:	5d                   	pop    %ebp
    13ff:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1400:	b8 68 1b 00 00       	mov    $0x1b68,%eax
    1405:	ba 68 1b 00 00       	mov    $0x1b68,%edx
    base.s.size = 0;
    140a:	31 c9                	xor    %ecx,%ecx
    base.s.ptr = freep = prevp = &base;
    140c:	a3 64 1b 00 00       	mov    %eax,0x1b64
    base.s.size = 0;
    1411:	b8 68 1b 00 00       	mov    $0x1b68,%eax
    base.s.ptr = freep = prevp = &base;
    1416:	89 15 68 1b 00 00    	mov    %edx,0x1b68
    base.s.size = 0;
    141c:	89 0d 6c 1b 00 00    	mov    %ecx,0x1b6c
    1422:	e9 53 ff ff ff       	jmp    137a <malloc+0x2a>
    1427:	89 f6                	mov    %esi,%esi
    1429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
    1430:	8b 08                	mov    (%eax),%ecx
    1432:	89 0a                	mov    %ecx,(%edx)
    1434:	eb b9                	jmp    13ef <malloc+0x9f>
