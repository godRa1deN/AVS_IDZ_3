	.intel_syntax noprefix
	.text
	.globl	f
f:
	endbr64
	push	rbp
	mov	rbp, rsp
	movq 	xmm4, t[rip]					#xmm4 = 0.5
	movq	QWORD PTR -8[rbp], xmm4			#локальная переменная double t; &t = rbp - 8
	movq	xmm3, rdi						#xmm3 = rdi = первый аргумент = x
	movq 	xmm0, rdi						#xmm0 = rdi = первый аргумент = x
	mulsd	xmm0, xmm0						#xmm0 = x * x
	mulsd	xmm0, xmm3						#xmm0 = x * x * x
	movsd	xmm1, xmm4						#xmm1 = t
	mulsd	xmm1, xmm3						#xmm1 = x * t
	mulsd	xmm1, xmm3						#xmm1 = x * x * t
	subsd	xmm0, xmm1						#xmm0 = x * x * x - x * x * t
	movsd	xmm1, xmm3						#xmm1 = x
	movsd	xmm2, const02[rip]				#xmm2 = 0.2
	mulsd	xmm1, xmm2						#xmm1 = 0.2 * x			
	addsd	xmm0, xmm1						#xmm0 = x * x * x - x * x * t + 0.2 * x	
	movsd	xmm1, const4[rip]				#xmm1 = 4.0
	subsd	xmm0, xmm1						#xmm0 = x * x * x - x * x * t + 0.2 * x - 4.0
	movq	rax, xmm0						#rax = возвращаемое значение = x * x * x - x * x * t + 0.2 * x - 4.0 
	pop	rbp
	ret
	.section	.rodata
	left:  .double   1.0
	right:  .double   3.0
	const2:	.double 2.0
	t: .double 0.5
	const02: .double 0.2
	const4: .double 4.0
.LC1:
	.string	"%lf"
.LC8:
	.string	"%.8lf"
	.text
	.globl	main
main:
	endbr64									
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	movsd	xmm5, left[rip]					#xmm5 = left
	movsd	xmm6, right[rip]				#xmm6 = right	
	lea	rcx, -8[rbp]						#rcx = rbp - 8
	mov	rsi, rcx							#rsi = второй аргумент = rbp - 8 = &e
	lea	rdx, .LC1[rip]						#rdx = "%lf"
	mov	rdi, rdx							#rdi = первый аргумент = "%lf"
	mov	eax, 0
	call	__isoc99_scanf@PLT	
	movsd	xmm7, QWORD PTR -8[rbp]			#xmm7 = e
	jmp	.L4									#прыгаем в .L4
.L7:										#тело цикла while
	movsd	xmm0, xmm5						#xmm0 = left
	addsd	xmm0, xmm6						#xmm0 = left + right
	movsd	xmm1, const2[rip]				#xmm1 = const2 = 2.0
	divsd	xmm0, xmm1						#xmm0 = (left + right) / 2
	movsd	xmm8, xmm0						#xmm8 = c
	movq	rax, xmm6									
	mov		rdi, rax						#rdi = right
	call	f								#f(right)
	movq	xmm0, rax						#xmm0 = f(right) = rax
	movsd	xmm9, xmm0						#сохраняем результат f(right) в xmm9						
	movq 	rdi, xmm8						#rdi = c
	call	f								#f(c)
	movq	xmm0, rax						#xmm0 = f(c) = rax
	movsd	xmm1, xmm9						#xmm1 = f(right)
	mulsd	xmm1, xmm0						#xmm1 = f(right) * f(c)
	pxor	xmm0, xmm0						#xmm0 = 0
	comisd	xmm0, xmm1						#cmp 0 | f(right) * f(c)
	jbe	.L10								#если f(right) * f(c) < 0 -> .L10
	movsd	xmm0, xmm8						#f(right) * f(c) >= 0 -> xmm0 = c
	movsd	xmm5, xmm0						#left = c
	jmp	.L4									#прыгаем в .L4
.L10:
	movsd	xmm0, xmm8						#f(right) * f(c) < 0 -> xmm0 = c
	movsd	xmm6, xmm0						#right = c
.L4:
	movsd	xmm0, xmm6						#xmm0 = right
	subsd	xmm0, xmm5						#xmm0 = right - left
	comisd	xmm0, xmm7						#сравниваем right - left | e
	ja	.L7									#если right - left > e -> прыгаем в .L7
	movsd	xmm0, xmm5						#xmm0 = left
	addsd	xmm0, xmm6						#xmm0 = left + right
	movsd	xmm1, const2[rip]				#xmm1 = 2.0
	divsd	xmm0, xmm1						#xmm0 = (left + right) / 2
	lea		rax, .LC8[rip]					#rax = форматная строка = "%.8lf"
	mov		rdi, rax						#rdi = первый аргумент = "%.8lf"
	mov		eax, 1							#выводим xmm0 = (left + right) / 2
	call	printf@PLT
	mov		eax, 0
	leave
	ret										#return 0
