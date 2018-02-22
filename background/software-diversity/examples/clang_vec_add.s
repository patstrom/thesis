	.text
	.file	"vec_add.cpp"
	.globl	_Z3add4vec2S_           # -- Begin function _Z3add4vec2S_
	.p2align	4, 0x90
	.type	_Z3add4vec2S_,@function
_Z3add4vec2S_:                          # @_Z3add4vec2S_
	.cfi_startproc
# BB#0:
	addps	%xmm1, %xmm0
	retq
.Lfunc_end0:
	.size	_Z3add4vec2S_, .Lfunc_end0-_Z3add4vec2S_
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 5.0.1 (tags/RELEASE_501/final)"
	.section	".note.GNU-stack","",@progbits
