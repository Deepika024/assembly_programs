					;using shifting

;.................................................................

data segment

    packed db 12h,34h,56h,78h,89h,21h,32h,43h
    unpacked db 8 dup(?)

data ends

;......................................................................


;.................................................................
          
code segment

    assume  ds:data,cs:code

    start:
            mov ax,data
            mov ds,ax
            
            xor ax,ax
            mov cx,8
            mov si,0 
            mov di,0
            
     next:  xor ax,ax			;initializing ax register to 0
            mov al,byte ptr packed[si]
            shl ax,4
            shr al,4
            mov word ptr unpacked[di],ax
            inc si
            inc di
            inc di
            loop next
          
     hlt
code ends
end start


;........................................................................            