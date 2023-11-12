	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 14, 0
	.globl	_print_hello_world              ; -- Begin function print_hello_world
	.p2align	2
_print_hello_world:                     ; @print_hello_world
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	x0, #0
	bl	_pthread_exit
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128
	.cfi_def_cfa_offset 128
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	str	wzr, [sp, #20]
	str	wzr, [sp, #12]
	b	LBB1_1
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #12]
	subs	w8, w8, #10
	cset	w8, ge
	tbnz	w8, #0, LBB1_6
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	add	x3, sp, #8
	mov	w8, #1
	str	w8, [sp, #8]
	ldrsw	x9, [sp, #12]
	add	x8, sp, #24
	add	x0, x8, x9, lsl #3
	mov	x1, #0
	adrp	x2, _print_hello_world@PAGE
	add	x2, x2, _print_hello_world@PAGEOFF
	bl	_pthread_create
	str	w0, [sp, #16]
	ldr	w8, [sp, #16]
	subs	w8, w8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB1_4
	b	LBB1_3
LBB1_3:
	ldr	w9, [sp, #16]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	mov	w0, #-1
	bl	_exit
LBB1_4:                                 ;   in Loop: Header=BB1_1 Depth=1
	b	LBB1_5
LBB1_5:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB1_1
LBB1_6:
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB1_8
	b	LBB1_7
LBB1_7:
	bl	___stack_chk_fail
LBB1_8:
	mov	w0, #0
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Hello World, Greetings from thread"

l_.str.1:                               ; @.str.1
	.asciz	"Opps, pthread_create returned error code %d"

.subsections_via_symbols
