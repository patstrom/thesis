	.file	"vec_add.cpp"
	.text
	.p2align 4,,15
	.globl	_Z3add4vec2S_
	.type	_Z3add4vec2S_, @function
_Z3add4vec2S_:
.LFB3:
	.cfi_startproc
	movq	%xmm0, %rcx
	movq	%xmm1, %rsi
	movd	%xmm0, -4(%rsp)
	shrq	$32, %rcx
	shrq	$32, %rsi
	movd	-4(%rsp), %xmm0
	movq	%rcx, -24(%rsp)
	movq	%rsi, -16(%rsp)
	movd	%xmm1, -4(%rsp)
	movss	-24(%rsp), %xmm2
	addss	-16(%rsp), %xmm2
	movd	-4(%rsp), %xmm1
	addss	%xmm1, %xmm0
	movd	%xmm2, %eax
	movq	%rax, %rdx
	movd	%xmm0, %eax
	salq	$32, %rdx
	orq	%rdx, %rax
	movq	%rax, -24(%rsp)
	movq	-24(%rsp), %xmm0
	ret
	.cfi_endproc
.LFE3:
	.size	_Z3add4vec2S_, .-_Z3add4vec2S_
	.ident	"GCC: (GNU) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
