	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	f
	.type	f, @function
f:
	endbr64
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC0[rip]
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, xmm0
	mulsd	xmm0, QWORD PTR -24[rbp]
	movsd	xmm1, QWORD PTR -8[rbp]
	mulsd	xmm1, QWORD PTR -24[rbp]
	movapd	xmm2, xmm1
	mulsd	xmm2, QWORD PTR -24[rbp]
	movapd	xmm1, xmm0
	subsd	xmm1, xmm2
	movsd	xmm2, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR .LC1[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC2[rip]
	subsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.size	f, .-f
	.section	.rodata
.LC5:
	.string	"%lf"
.LC8:
	.string	"%.8lf"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	movsd	xmm0, QWORD PTR .LC3[rip]
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC4[rip]
	movsd	QWORD PTR -16[rbp], xmm0
	lea	rax, -32[rbp]
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	jmp	.L4
.L7:
	movsd	xmm0, QWORD PTR -8[rbp]
	addsd	xmm0, QWORD PTR -16[rbp]
	movsd	xmm1, QWORD PTR .LC6[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rax
	call	f
	movsd	QWORD PTR -40[rbp], xmm0
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rax
	call	f
	movsd	xmm1, QWORD PTR -40[rbp]
	mulsd	xmm1, xmm0
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	jbe	.L10
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -8[rbp], xmm0
	jmp	.L4
.L10:
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -16[rbp], xmm0
.L4:
	movsd	xmm0, QWORD PTR -16[rbp]
	subsd	xmm0, QWORD PTR -8[rbp]
	movsd	xmm1, QWORD PTR -32[rbp]
	comisd	xmm0, xmm1
	ja	.L7
	movsd	xmm0, QWORD PTR -8[rbp]
	addsd	xmm0, QWORD PTR -16[rbp]
	movsd	xmm1, QWORD PTR .LC6[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	lea	rax, .LC8[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1071644672
	.align 8
.LC1:
	.long	-1717986918
	.long	1070176665
	.align 8
.LC2:
	.long	0
	.long	1074790400
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	0
	.long	1074266112
	.align 8
.LC6:
	.long	0
	.long	1073741824
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
