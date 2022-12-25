jmp mulai
masukkan db "Masukkan tombol: $"
        
msg1: db " = angka. ",0dh,0ah,'$'
msg2: db " = huruf besar. ",0dh,0ah,'$'
msg3: db " = huruf kecil. ",0dh,0ah,'$'
msg4: db " = karakter lain. ",0dh,0ah,'$'                                                   

mulai:
mov dx, offset masukkan
mov ah, 9
int 21h

mov ah, 1
int 21h
cmp al, 1bh         ; stop ESC
jz exit

cmp al, 30h
ja bandingkan1      ;jump if bellow al < '0'
jb karakter_lain   
bandingkan1:
    cmp al, 39h    
    jb angka        ;jump if above  al > '9'   
   
cmp al, 41h
ja bandingkan2      ;jump if bellow al < 'A'
jb karakter_lain
bandingkan2:
    cmp al, 5bh
    jb huruf_besar  ;jump if above al < '5b'
   
cmp al, 61h     
ja bandingkan3      ;jump if bellow al < 'a'
jb karakter_lain
bandingkan3:
    cmp al, 7bh  
    jb huruf_kecil  ;jump if above al < '7b'
   
exit:
ret

angka:
    mov dx, msg1
    mov ah, 9
    int 21h
    jmp mulai
huruf_besar:
    mov dx, msg2
    mov ah, 9
    int 21h
    jmp mulai
huruf_kecil:
    mov dx, msg3
    mov ah, 9
    int 21h
    jmp mulai
karakter_lain:
    mov dx, msg4
    mov ah, 9
    int 21h

    jmp mulai