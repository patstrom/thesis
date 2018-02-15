	.text
	.file	"gcd.c"
	.globl	gcd                     # -- Begin function gcd
	.p2align	4, 0x90
	.type	gcd,@function
gcd:                                    # @gcd
	.cfi_startproc
# BB#0:
	movl	%edi, -4(%rsp)
	movl	%esi, -8(%rsp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, -8(%rsp)
	je	.LBB0_3
# BB#2:                                 #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rsp), %eax
	cltd
	idivl	-8(%rsp)
	movl	%edx, -12(%rsp)
	movl	-8(%rsp), %edx
	movl	%edx, -4(%rsp)
	movl	-12(%rsp), %edx
	movl	%edx, -8(%rsp)
	jmp	.LBB0_1
.LBB0_3:
	movl	-4(%rsp), %eax
	retq
.Lfunc_end0:
	.size	gcd, .Lfunc_end0-gcd
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 5.0.1 (tags/RELEASE_501/final)"
	.section	".note.GNU-stack","",@progbits
