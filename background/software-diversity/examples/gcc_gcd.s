	.file	"gcd.c"
	.text
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB0:
	.cfi_startproc
	movl	%edi, -20(%rsp)
	movl	%esi, -24(%rsp)
	jmp	.L2
.L3:
	movl	-20(%rsp), %eax
	cltd
	idivl	-24(%rsp)
	movl	%edx, -4(%rsp)
	movl	-24(%rsp), %eax
	movl	%eax, -20(%rsp)
	movl	-4(%rsp), %eax
	movl	%eax, -24(%rsp)
.L2:
	cmpl	$0, -24(%rsp)
	jne	.L3
	movl	-20(%rsp), %eax
	ret
	.cfi_endproc
.LFE0:
	.size	gcd, .-gcd
	.ident	"GCC: (GNU) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
