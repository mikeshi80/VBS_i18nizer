D i m   S t r i n g T a b l e  
 S e t   S t r i n g T a b l e   =   C r e a t e O b j e c t ( " S c r i p t i n g . D i c t i o n a r y " )  
 S t r i n g T a b l e . C o m p a r e M o d e   =   v b B T e x t C o m p a r e  
  
 F u n c t i o n   G e t F i l e N a m e ( )  
         D i m   l o c a l e  
         l o c a l e   =   G e t L o c a l e ( )  
         s e l e c t   c a s e   l o c a l e  
                 c a s e   2 0 5 2  
                         G e t F i l e N a m e   =   " S t r i n g T a b l e _ C N . R C "  
                 c a s e   1 0 4 1  
                         G e t F i l e N a m e   =   " S t r i n g T a b l e _ J P . R C "  
                 c a s e   E l s e  
                         G e t F i l e N a m e   =   " S t r i n g T a b l e . R C "  
         e n d   s e l e c t  
 E n d   F u n c t i o n  
  
 S u b   L o a d S t r i n g T a b l e ( f i l e n a m e )  
         D i m   f s o ,   f i l e ,   p a t t ,   r e ,   m a t c h e s ,   t e x t l i n e  
         S e t   r e   =   n e w   R e g E x p  
         r e . P a t t e r n   =   " \ s * ( \ d + ) \ s + ( " " [ ^ " " ] * " " ) \ s * ( / / . * ) ? "  
         S e t   f s o   =   C r e a t e O b j e c t ( " S c r i p t i n g . F i l e S y s t e m O b j e c t " )  
         S e t   f i l e   =   f s o . O p e n T e x t F i l e ( f i l e n a m e ,   1 ,   F a l s e ,   - 1 )  
  
         D o   W h i l e   f i l e . A t E n d O f S t r e a m   < >   T r u e  
                 t e x t l i n e   =   f i l e . R e a d L i n e  
                 s e t   m a t c h e s   =   r e . E x e c u t e ( t e x t l i n e )  
                 F o r   E a c h   m a t c h   i n   m a t c h e s  
                         S t r i n g T a b l e . A d d   m a t c h . S u b M a t c h e s ( 0 ) ,   m a t c h . S u b M a t c h e s ( 1 )  
                 N e x t  
         L o o p  
         f i l e . C l o s e ( )  
          
 E n d   S u b  
  
 F u n c t i o n   L o a d R e s S t r i n g ( i d )  
         L o a d R e s S t r i n g   =   S t r i n g T a b l e . I t e m ( C S t r ( i d ) )  
 E n d   F u n c t i o n  
  
 L o a d S t r i n g T a b l e   G e t F i l e N a m e ( )  
 M s g B o x ( L o a d R e s S t r i n g ( 1 0 0 1 ) )  
 