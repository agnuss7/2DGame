GDPC                                                                               d   res://.import/ddt5r2m-38b8c791-a12b-460a-bf2b-42128353e4a2.png-ac881082f1abb37e598e644568fe11dd.stexP      �%      G�a6������,UH <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex�E      U      -��`�0��x�5�[   res://Scene.tscn�      �      K0Rp�b�iQ�&r�|t$   res://animations/walkingDown.tres   �      �      �*��ox2Ȏ)�۬�$   res://animations/walkingLeft.tres          �      �Շ�_n^����}� $   res://animations/walkingRight.tres  �      �      Ԓ��k�ɚ�7A=���    res://animations/walkingUp.tres `      �      ��p����l���@ʾ    res://camera_movement.gd.remap  pU      *       wvre�ʁ�li����   res://camera_movement.gdc          r      ��(�����_&��b~�   res://char_movement.gd.remap�U      (       %]�8��j����v��e   res://char_movement.gdc �      �      �����8�7aь>�H�@   res://ddt5r2m-38b8c791-a12b-460a-bf2b-42128353e4a2.png.import   �A      �      0��6F��aXF   res://default_env.tres  �D      �       um�`�N��<*ỳ�8   res://icon.png  �U      �      G1?��z�c��vN��   res://icon.png.import   �R      �      �����%��(#AB�   res://project.binary�b      �      c�ޠ�w�O^��n��        [gd_scene load_steps=10 format=2]

[ext_resource path="res://ddt5r2m-38b8c791-a12b-460a-bf2b-42128353e4a2.png" type="Texture" id=1]
[ext_resource path="res://char_movement.gd" type="Script" id=2]
[ext_resource path="res://animations/walkingLeft.tres" type="Animation" id=3]
[ext_resource path="res://animations/walkingDown.tres" type="Animation" id=4]
[ext_resource path="res://animations/walkingUp.tres" type="Animation" id=5]
[ext_resource path="res://animations/walkingRight.tres" type="Animation" id=6]
[ext_resource path="res://camera_movement.gd" type="Script" id=7]
[ext_resource path="res://icon.png" type="Texture" id=8]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 10.4637, 10 )

[node name="Node2D" type="Node2D"]

[node name="Background" type="Sprite" parent="."]
position = Vector2( 7.05942, 52.5222 )
scale = Vector2( 11.4485, 10.2763 )
texture = ExtResource( 8 )
region_enabled = true
region_rect = Rect2( 0, 0, 60, 60 )

[node name="Camera2D" type="Camera2D" parent="."]
current = true
smoothing_enabled = true
script = ExtResource( 7 )

[node name="KinematicBody2D" type="KinematicBody2D" parent="."]
script = ExtResource( 2 )

[node name="Sprite" type="Sprite" parent="KinematicBody2D"]
position = Vector2( 0.187289, -0.641212 )
scale = Vector2( 0.326932, 0.306001 )
texture = ExtResource( 1 )
vframes = 4
hframes = 3

[node name="CollisionShape2D" type="CollisionShape2D" parent="KinematicBody2D"]
shape = SubResource( 1 )

[node name="AnimationPlayer" type="AnimationPlayer" parent="KinematicBody2D"]
anims/walkingDown = ExtResource( 4 )
anims/walkingLeft = ExtResource( 3 )
anims/walkingRight = ExtResource( 6 )
anims/walkingUp = ExtResource( 5 )
         [gd_resource type="Animation" format=2]

[resource]
resource_name = "walkingDown"
length = 1.6
loop = true
tracks/0/type = "value"
tracks/0/path = NodePath("Sprite:frame")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0, 0.4, 0.8, 1.2 ),
"transitions": PoolRealArray( 1, 1, 1, 1 ),
"update": 1,
"values": [ 0, 1, 2, 1 ]
}
  [gd_resource type="Animation" format=2]

[resource]
resource_name = "walkingLeft"
length = 1.6
loop = true
tracks/0/type = "value"
tracks/0/path = NodePath("Sprite:frame")
tracks/0/interp = 1
tracks/0/loop_wrap = false
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0, 0.4, 0.8, 1.2 ),
"transitions": PoolRealArray( 1, 1, 1, 1 ),
"update": 1,
"values": [ 3, 4, 5, 4 ]
}
 [gd_resource type="Animation" format=2]

[resource]
resource_name = "walkingRight"
length = 1.6
loop = true
tracks/0/type = "value"
tracks/0/path = NodePath("Sprite:frame")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0, 0.4, 0.8, 1.2 ),
"transitions": PoolRealArray( 1, 1, 1, 1 ),
"update": 1,
"values": [ 6, 7, 8, 7 ]
}
 [gd_resource type="Animation" format=2]

[resource]
resource_name = "walkingUp"
length = 1.6
loop = true
tracks/0/type = "value"
tracks/0/path = NodePath("Sprite:frame")
tracks/0/interp = 1
tracks/0/loop_wrap = true
tracks/0/imported = false
tracks/0/enabled = true
tracks/0/keys = {
"times": PoolRealArray( 0, 0.4, 0.8, 1.2 ),
"transitions": PoolRealArray( 1, 1, 1, 1 ),
"update": 1,
"values": [ 9, 10, 11, 10 ]
}
 GDSC            �      �����ׄ򶶶�   �����϶�   ���������Ŷ�   ��Ҷ   �������Ӷ���   ���¶���   �������¶���   �����������۶���   �������ض���   ϶��   ��Ҷ   ����Ӷ��   ���������¶�   ζ��   ����������¶   ��������ƶ��   ����������¶   �������Ŷ���   ����׶��      ../Background         ../KinematicBody2D                                                      	      
   *      >      R      f      z      �      �      �      �      �      �      �      �      �      3YYYY0�  PQV�  �  PQ�  Y0�  PQV�  ;�  �  PQ�  ;�  �  PQT�  PQ�  �  �  T�  T�	  �  T�
  T�	  �  T�  T�	  �  �  �  T�  T�  �  T�
  T�  �  T�  T�  �  �  �  T�  T�  �  T�
  T�  �  T�  T�  �  �  �  T�  T�	  �  T�
  T�	  �  T�  T�	  �  �?  P�  T�  QYY0�  P�  QV�  �  �  P�  QT�  YYYYYY`              GDSC         8   @     ������������τ�   ����Ҷ��   �������϶���   ���Ӷ���   ����¶��   ���¶���   �ƶ�   ���ض���   ��������޶��   ������¶   ��������¶��   ����¶��   ����������������Ҷ��   ζ��   �����Ӷ�   �����޶�   ϶��   ���������Ҷ�   ���������Ŷ�   ��������������Ķ   ���϶���   ���ƶ���   ���������������Ŷ���   ����׶��   �������������Ӷ�   A         right                      left      down      up        walkingRight      @      walkingDown    	   walkingUp                                                       	   !   
   #      %      ,      3      4      :      @      I      O      W      ^      d      j      s      y      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *     +     ,     -     .   #  /   $  0   %  1   ,  2   0  3   7  4   ;  5   <  6   =  7   >  8   3YY8P�  Q;�  YY;�  �  PQY>�  N�  �  R�  �  R�  �  R�  �  YOY;�  �  T�  Y;�	  �  T�  YY0�
  PQV�  �  �  PQ�  &�  T�  P�  QV�  �  T�  �  �  &�  �  T�  V�  W�  T�  �  �  �  �  T�  �  �	  �  T�  �  &�  T�  P�  QV�  �  T�  �  �  &�  �  T�  V�  W�  T�  �  �  �  �  T�  �  �	  �  T�  �  &�  T�  P�  QV�  �  T�  �  �  �	  �  T�  �  &�  T�  P�  QV�  �  T�  �  �  �	  �  T�  �  �  �  T�  PQ�  YYY0�  PQV�  &�  T�  P�  Q�  T�  P�  QV�  W�  T�  P�  R�  R�  Q�  '�  T�  P�  QV�  W�  T�  P�	  R�  R�  Q�  '�  T�  P�  QV�  W�  T�  P�
  R�  R�  Q�  (V�  W�  T�  PQ�  YY0�  P�  QV�  �
  PQ�  �  �  P�  Q�  �  PQ�  YYY`  GDST`   �           k%  PNG �PNG

   IHDR   `   �   ��l�   sRGB ���    IDATx��}l���g,J�MI1%JVM�$eK�):�5Qh$^ǹ�u�8Mp�Y
�.�"�p�������mn{i�A�d���;��C�����Z4���i}�XV86E[r�!cӖ,J�%Q�MRs̼/�󝟔e�Dg������78�
x�F">�A @R�@�,"��  �|��9�s��nuP\������J�P\�9J��ވϣD�x�juCl�ݏ���U�5D|�v,��E�_7�)����G#A��� �'�=�E���ݝ!���!)g��X ���Cl��'̦�	t?Cb$�����ٱ��d� �~`���M���"�r���}g ���YlH��B  �����$����b� �L+vF8鎭�3�c��H�$����t����tG���{z�l�W��0�h@orL5B�0C��@R� ��� �����3�ww��y�yk�3g{O$������"�u2�� Лc��?��:'M�.dI�74�2�&���1��V�V:o�ZI9�H�}g�l(��@I9�ĵ����H�}҈����[������ H}�꾉���[;/ ��M��D�K@�پ�i��M���i��0:M�K�� � �!��@�.B�.�1�?g���>''��"u�~ �&B��d�����R�`Z��<��h �gӐ���r D ��� Jp�,� ��$y������zc�^ �O���P/�4{h�H�򤫋�%��z@^& h��F����:?����طo���rF���W_ƳO�d�x����9����t�W�K信� 9_T">u�}�����,b�/��/�lN��ص� t���? �ks;>�G���>���Ey���EÒ0��0���C,% V!_H�+?�= �/�l�x���\���o �� ��:���١ �-�7���M {��>���fB���`:- �Q��'� ���� ����� ���鷓�H}�W������0��<��/�S�ww��Le��-/�"^v�B����Fh���<"^"^= 67ˤ��A�Ʉ�0����[[+�-�C��c��"r^(��_4�Q���d*�[	�a�h-9���fNZ��o �;��0�U�|Q�a���/b�7ҝ/�q��.�8����yI ��kl�o0��+�Q2ޤ@Һ'  ��G2��+ (�Pny� n,�a zO& t� x��9|�v� ��O��R����C��αs��nB�`�� @����Z����� ����՞�O����?��?:�����n~ȕ�����F�?CW��>���sj��"6$Frl�x~����+ϴ;�@����"n�CB�B��*ݓ�� Sh�<\ܭ�<��^CX�?����j��cv��y�|c;�� ��Sx��͝� �vs9*G�N(Gݭ�s�c���?�_��) &����k�;���y�nr<U]¡� �_NaU�V � �y�c��1S�AFL*aG[=jP�?~9�-���8�úM�3x���x4�����t<�漙n �x� ��۱� ����B��#S6�f
�d��$;��8>p[����� (Orf �Ld��0p9�� ϴ"�i�c�a�x��\�T���)�h���j*�h����d�ف��N�X*�"�7�� �,�ϛ����s�?ɩ��q��VC��mP^ٸ�y�	ǫ������: ^x��Mj ��F04�2x��b��Y]�C�%���^�b�j�����V�?��6� %&�tN @B���щ����i���R����N���x{;�q^��?�G��џ�x]#>���c�&;�t�W�!��hCxzܕ> ,�}� ��p ��%�T�h��#��_T�Y� �V�r�<9L�Ld��H͖px�2�HP ����@��x���l_���jMϻER�oܸ�=W?�q���"���z�ndA0|�KWp���* Jyd��ގ��8R�뱣-��� X܊�N��#H\���s�.�
@L*9p���]���Ρ�-�x��%u.P�^ �1xG[І���������Ko`��*�E1  ܲ?��b��4>����ڢLb�ؑ��gϷ����Ӻ;J: �|����
���_���G��O. 3�C���1 �+U�"���-`��e��J�r�Z]���� �/�ni@B�»�{�x�;���Ng p�
�, �L;^;��G���w~
 �}ޑ ����q��ߡ�-�6 �Y�؊�[��s%v���P��R�w�iG��9�;��y@�����/ h�{��$�����/��\I�C���}�l�]�Ĥ��Ҡ���v	P���B��V׳s���l4`(;�C�j4�M� �����,vy�1�٪�KQ�!��s� ;�l��U���×u�M��}��)t�v6. M��QX���
dK{;~|�|�4꤄R��xd[���R�l��9Ѐx��8 ����ni��F�ǳ�q;�����qg��1	�
��f��ϕ� l��kY� �q6g�m��ui���)� �P���73i)�q6ǢOp̭�'�4;��[���jC�	���==>���;�B�8:Wb#��@�+�9]�.o�~	 29v��p��*��'r�@�W&r�=s��	���  i�]����Xҽ^���5���[[tǥ�'T����i�нm+�7�q�>�O�f�k=��sf"�`��?k� ��]Un��.o)��iK�I�tK(�c�^f�Gr��� ���B��A���؏�4��b��o�s*;CAD�k �&q,�!�M��L��6���LU�oЭ�ڎ���l ��@�3�.J��v��OC� �; �h4A ě���C2�;Tk�+��~����lvJ^���U\���ڤ�� �������S���:ַ�d���$ǆ�ޤ���S��gl{��� 5؏Εɹ$lƉ7+�=�!�7\���n[d��HN����E��k#9���� (n��6Tj����P-�2r��f��N7��^Gv�B 0�~������6�X� K�$R����g��3 z������:�p���eGwG���u~�����	�M������6�	Jw�	��1F���L%	�Ͻ�*s����bF�����Xv ��eNht��Q����Tp.C����cHN�/�a����D  5�2C 0�6�>����z�C���l���ۢ�J9������W���T�{�?  J�M}gӈ�y�x��$	Ն��'�g�Lob$�XИV��r��� ��Q<=�  zO$�I]Q@KJPl�d��OG?�l ^>E&Q�Ih<&;#9D�A�Ȱ�e�� 6��/3��<]���8���,�%��2�o�
Z: LD�.b�[���;�w6�_}o�ۋg�މ���w6���#1�c�7����%z���l�e@��f ��L�_����M�o�`�s;�XG3;�"6R�A2����?:SIR޲�o� �@�Ʉ��]	3�ȳC70;t��ؾQ��~��'uQZ�HFe��% �!� �e����9�Z_��,嗟{�{��������dQ ��o� �����޽=f�m#8����D����wm5���q�I����6�����5��� ��a��ӯ	��������l�R�G���.LF�е�|2��a��m_�"΍��U��I���Kи��~Ќ���I7ǎ6��, �����ǘ2 :&t2�aq&9���a��٧wb�r_��U�Zz�(%_�Y�`��v
�ޓ	to���';H7ǐ�5�ӲPQ�����OĞ�Ъ:���ﹳ�7�m �?:c��⮤��������,u�����6ߙ��r&
<���g��{��~7�� _���0;bԮș~�Aj��� ����;���XЀ�Net- @�}�gJ0������q-���R	;6� ?:����;�gTj��� P��x,�2�A77,�=ԍ!�Ur�KO}?��^[#��WNJ Y��:���*ɉ��ȍ���j����OC]�~K����gϷ�� P�݊��6\ �A�b�J�9=�zi]@y4�g���l��5M����-�o����5�w��@O�J��c n��K�Jxr���y�4*6  ��s��I�.��ܧ|8z{����hl#5[8��<����VmҟԆ@�E@���gt �)�|�-d��ܴ*���<bR��0F��1p�Gg ���v�
e���!i��B�z��Xe=νo���9  �����e�V���>Ǜq �{���G������T�o� 9_dkr��D��A�W6�7Da<?9_4,�"G�J��ef\��S̎S�����܊0��)<�Z���J��Ѧ˜��qi���$���k����)�LQXHPyq��?��+:�5պ��M�m f��j|��i�h�����&$�Y�˭�ޞ ��-|��?��)�y	�
��N�5�L��[w/H7/b >�]>�]fZ7��k��'r���I� �y�	��G� ��Vhi:��V�I�U~��yM'/J�ǿCۈ������~?�W6�Gv
)N?]�U�������m�����nN�)��Jҟ�1(vi�Ya`jX�}զ �x���<~>�Ε����^���?Z��= ���+0��oioGc���ź�i	�͝[1p*�[��lf`�M�(/JjMV�^3lg����8x�
�����1&U��"O�����2^U�~o�?Nz�T��D�l�\���1WrU�;�Q��U:)Z��l ���r������-��.�NשR-�{:�(� cukt�|;윏��
 $2�!�	�z�SF~rl�-5Q݅ ���D�F`�;�����9���U����'�3Hd& �������-�*G^cX?������I�"Q� �ktQ�BuS|�}?�G���8���ɔ�_�������v��@�{�&
��� ���������HnҔ������Vi���u���tJ �b,����![LD	����OJNT\��s+M܎���a�QS���O�M��)�a ���NW��w��MG�Ϡ3T_�h�5�d����7~��#��7��b�Ϙ�>�/3������d0�z�W��� pSH\��Ĉ�d� f�y�4�Hnq�b��6 H��R΃-��yjܯ��o���j ��\/]��g�t �����gXiHg+N���h.���)��u5 B B�Q�W:=�b�' ��M���;����o��g2SA�ޤuu�Jl��{� p�;��G�^#�jTp��0_��H�D�ը�6,��n&�{
��n~�ON�wV�.���bE����
ik�X��S�S��	 f,�@����ғr�锧���� X���=�ߪ� *��l�h��黐ֽ����H'��w6m��`g�R�o� � �t�Mz�<]d������f���@��y @u�� ��FY-f �q�-D�'YfB��lI�:Nc򋯾l��N���X2 lV ��/�o0�"��O	c�^��Mc�!<��N��o/^|�e��M�٧wb�[+��4 �� I�y0�ןܦ�y�V甾��{ ���~��ݝ����Ϟs4�L">��0_�X�)�$�u4c�s;14x�U/��������o�vY!l��w\���L@�+.5 
O�x��p��o�X��ν���<w�J��5�R�e�0�e! Dx B�{�- n�����y�󬛿�ܣl?���Nts�]��K��@w�'�Ӹ���������@��@��7�;���C������:�gl�J��p�*`kxâ��5Vfw#9to��{{��k ��
g�
�?�MG��lŶ/~��B踟�-@X�v~9L�^	��ڶh����}�i��;�W�ݳ�M[��#w� ,D(��w�t�D������Mz��a�lJ��20j��
��#�@�# u^�R��!������&�G��Ӗ�M"m~pwL���/������Y��|����# �����o6��Q �z��'1��a�Gg��̿~��sGN}���� T ��/*�Y)ҺiA�Wk[��*�cϞoc]0���G�������^L�����¢�o[�^����s�<�U][��/��� �+UC��' �x"�xU���=��t�����(�~���g��������{	��_�����)�3����u�M ��6���������I���$��s^?��S��T��V�#~k��Һ�# V�|>'�PC�6�_���R�]�*�]�_��i^7N1�3��3�5��qqɿ �u�wo��Ͼ����G �t=j�B?�D��U蹯Z�ǋ5Ŋ��;�P�ʼ|�<՞���(�
B���_��S��n�1{� u¿C�g��7J<���j�7��F59C��^`�����J�Z�]�^�K�³�8�f='�"K�B�/������Q+�#~�3@KN�r
��{����&�aG[{:��Ԝ��[K���@���8(�³S��ц�V\�"��/�Rjy}�\5B��XS�-���>��y�͠?��k
�HN��k=ޱ�',�G�uw�~NyM�cG[�;w�Ǫm��R$@����2�~z��.$�Ta��[�.��O�)~� Ʉ]�J� ��g��n`z)?�, 6<��b��vt�灌� �g f$�h/9�	���'0z�4z{�0	V �
�q���a �͡qu=^��wad� @�ǿŵ�)�B}E��"iy\ ��o!��(�o��S�F��E��m{�\�qt0������0e㠂�V̕��"G�������|����]�°
qI	 �f
,?a��絒�T��d��i��܅~��@��Lw����π��z$j���y c$Ӌ���^L����������C\���^�Z���ow3�~  ��9 �
(�P�T��F���P��s%��`�e�}��,��u����￫!ؑ��9�{w�Pv7���0��$���&uBt�O���i�w�T��W�<�/l�dxg �W����ԭ��J
F*���/X��M�[&2�����@��� �<�f� .m`��	�=���L#o��嵇w��	� vz|".�gΡλవj|�N�!&�Zq�%�wn?�������4�� 1�F��;5�����s�rP	9�7̦��p��z��3
 �k[qJ�0�-n�i�|��Hn��:��l�[ �����s;����sl��LР�D�V75�������r��E���t9"�� �+�暂v�0��S9�΀�_��&�y��d�Yc���r�_���s�v;ݮ��Q�[��u9;�t�$����O�h�;*ԯ���n��� �b`'I�/�CR�}X�Ԏ{ Nb�����1N>_��1�8 ����zϢ�p��w��[ ����k������y���nr��|���W1�[D�L�]�o�l�RZ ��(�A*��c�KM���(���ۍ\��Y��� 0f��n��lf_/�l?7����1��� ��`���M��L$���b��3��i��ܓ.������,3 ��Յ���k�3��A�X=��0����M�R�`�t�� gV�t!KS��X�_?��{�/_쩉s��&;����ۮ�� ��Db6�'���%_;��g,Tot[�n)�7<&"&����7� ����T�ݩ�=�����JN�� ;��f緒����ٺ+B�"עr�����q<` �C|�/f߭&DN">�뺡f���*����V=��A� o��r�sHo��(DC�z���d�xE,���nަQI 8���,�@�2����f't��� @����¹m��x �����\R��>�M+5�F�aW�_ʋ��{2��<^D0ę�7(w�|" �E�#����%�$?����D`8K��v�J�3ے���PG�Z?����+h��&H�n	fV��t��@�����n5G|�PLey[��=<���#  IDATdo����1_������A`�+�@�+LvR��tQb�ٰ#F�������d(������Ġu��a1�@���Ȏ&��>�E�D�p���\1
y�x;���f�?l������V8���y����,�c�0���fSV���W<�h�]���UP<��,�/]�T#����U�l���4O5��?���7�Y�a�0�&��� �����&�����f�J4׮®uuhn
�h��� ���#�ʰ���X����̎��<�+��EӚzf���!blrc��hZS�l!����/�_�:r�����wt�\Y+`������t Q&%/|v�SO!�)G��ZvR���EX�ރ7���5�����l#��h8���{H�y�ޣf�.��y�	lɹ" �\��#o8m3k+���i5av��n�q�^ܰ�y<�f@y t�[�&g�<a+���W��A�	ԛ*����l2�a�"��軸�& ��J�ʍFwb�<n�p%lw�J�Jw�E� ����	"Qo�=�`�)_v�IL�����=�0D��H�n3���5�}鹂��b��G2$�[�5�������O��tY� X�e¢PЮh;�<p*�^�E9��i����D�)���ֶ���t=���ѤZx��M�o��uo�Y�&wg|ڭ�꙰�+ڎ�ɋ����YR� X��u] E�R� ��� ���@v���'ݚ.���SI���TB���Yy�~�g���}Ǡ�I�����"F�{+��t�� `f���QµsD|�Roz��r��8�B�������;%Z[����������].�'�*���s%�]Y�u+X�pQ�0��7SP��w���-3 �sӬd������l� ���a��@/��t c&o4 w&��b��p6���vVN������E� RB�R V�����[��ߟ�P2��l�;%�Z���`����@vkW�X*rl ~�"J8 ������l��)��kD�@�ःDH�17��`6|���S��mm[�\���H�_�ϡ;��F�+��	ܚgmi 9} ��c*�,��*�z�S l� �˗'Ԓ�7�ЯOJX(��"�7�8��F����f�\4/ �F.�xh=�ӼJ��B��P��q-k��`vR���a�P�c��ǟ�����	��p^��e��n��=��v��K�6�Ow�g��_�3�O_!�$7Ae:��l�D�>�*�a����s/݂�'Et���g�	�ۮ%K8��6�z?��z�����3,� O����/�s1�    IEND�B`�         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/ddt5r2m-38b8c791-a12b-460a-bf2b-42128353e4a2.png-ac881082f1abb37e598e644568fe11dd.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://ddt5r2m-38b8c791-a12b-460a-bf2b-42128353e4a2.png"
dest_files=[ "res://.import/ddt5r2m-38b8c791-a12b-460a-bf2b-42128353e4a2.png-ac881082f1abb37e598e644568fe11dd.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
        [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @           9  PNG �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx�ݜytTU��?��WK*�=���%�  F����0N��݂:���Q�v��{�[�����E�ӋH���:���B�� YHB*d_*�jyo�(*M�JR!h��S�T��w�߻���ro���� N�\���D�*]��c����z��D�R�[�
5Jg��9E�|JxF׵'�a���Q���BH�~���!����w�A�b
C1�dB�.-�#��ihn�����u��B��1YSB<%�������dA�����C�$+(�����]�BR���Qsu][`
�DV����у�1�G���j�G͕IY! L1�]��� +FS�IY!IP ��|�}��*A��H��R�tQq����D`TW���p\3���M���,�fQ����d��h�m7r�U��f������.��ik�>O�;��xm��'j�u�(o}�����Q�S�-��cBc��d��rI�Ϛ�$I|]�ơ�vJkZ�9>��f����@EuC�~�2�ym�ش��U�\�KAZ4��b�4������;�X婐����@Hg@���o��W�b�x�)����3]j_��V;K����7�u����;o�������;=|��Ŗ}5��0q�$�!?��9�|�5tv�C�sHPTX@t����w�nw��۝�8�=s�p��I}�DZ-̝�ǆ�'�;=����R�PR�ۥu���u��ǻC�sH`��>�p�P ���O3R�������۝�SZ7 �p��o�P!�
��� �l��ހmT�Ƴێ�gA��gm�j����iG���B� ܦ(��cX�}4ۻB��ao��"����� ����G�7���H���æ;,NW?��[��`�r~��w�kl�d4�������YT7�P��5lF�BEc��=<�����?�:]�������G�Μ�{������n�v��%���7�eoݪ��
�QX¬)�JKb����W�[�G ��P$��k�Y:;�����{���a��&�eפ�����O�5,;����yx�b>=fc�* �z��{�fr��7��p���Ôִ�P����t^�]͑�~zs.�3����4��<IG�w�e��e��ih�/ˆ�9�H��f�?����O��.O��;!��]���x�-$E�a1ɜ�u�+7Ȃ�w�md��5���C.��\��X��1?�Nغ/�� ��~��<:k?8��X���!���[���꩓��g��:��E����>��꩓�u��A���	iI4���^v:�^l/;MC��	iI��TM-$�X�;iLH���;iI1�Zm7����P~��G�&g�|BfqV#�M������%��TM��mB�/�)����f����~3m`��������m�Ȉ�Ƽq!cr�pc�8fd���Mۨkl�}P�Л�汻��3p�̤H�>+���1D��i�aۡz�
������Z�Lz|8��.ִQ��v@�1%&���͏�������m���KH�� �p8H�4�9����/*)�aa��g�r�w��F36���(���7�fw����P��&�c����{﹏E7-f�M�).���9��$F�f r �9'1��s2).��G��{���?,�
�G��p�µ�QU�UO�����>��/�g���,�M��5�ʖ�e˃�d����/�M`�=�y=�����f�ӫQU�k'��E�F�+ =΂���
l�&���%%�������F#KY����O7>��;w���l6***B�g)�#W�/�k2�������TJ�'����=!Q@mKYYYdg��$Ib��E�j6�U�,Z�鼌Uvv6YYYԶ��}( ���ߠ#x~�s,X0�����rY��yz�	|r�6l����cN��5ϑ��KBB���5ϡ#xq�7�`=4A�o�xds)�~wO�z�^��m���n�Ds�������e|�0�u��k�ٱ:��RN��w�/!�^�<�ͣ�K1d�F����:�������ˣ����%U�Ą������l{�y����)<�G�y�`}�t��y!��O@� A� Y��sv:K�J��ՎۣQ�܃��T6y�ǯ�Zi
��<�F��1>�	c#�Ǉ��i�L��D�� �u�awe1�e&')�_�Ǝ^V�i߀4�$G�:��r��>h�hݝ������t;)�� &�@zl�Ұր��V6�T�+����0q��L���[t���N&e��Z��ˆ/����(�i啝'i�R�����?:
P].L��S��E�݅�Á�.a6�WjY$F�9P�«����V^7���1Ȓ� �b6�(����0"�k�;�@MC���N�]7 �)Q|s����QfdI���5 ��.f��#1���G���z���>)�N�>�L0T�ۘ5}��Y[�W뿼mj���n���S?�v��ْ|.FE"=�ߑ��q����������p����3�¬8�T�GZ���4ݪ�0�L�Y��jRH��.X�&�v����#�t��7y_#�[�o��V�O����^�����paV�&J�V+V��QY����f+m��(�?/������{�X��:�!:5�G�x���I����HG�%�/�LZ\8/����yLf�Æ>�X�Єǣq���$E������E�Ǣ�����gێ��s�rxO��x孏Q]n���LH����98�i�0==���O$5��o^����>6�a� �*�)?^Ca��yv&���%�5>�n�bŜL:��y�w���/��o�褨A���y,[|=1�VZ�U>,?͑���w��u5d�#�K�b�D�&�:�����l~�S\���[CrTV�$����y��;#�������6�y��3ݸ5��.�V��K���{�,-ւ� k1aB���x���	LL� ����ңl۱������!U��0L�ϴ��O\t$Yi�D�Dm��]|�m���M�3���bT�
�N_����~uiIc��M�DZI���Wgkn����C��!xSv�Pt�F��kڨ��������OKh��L����Z&ip��
ޅ���U�C�[�6��p���;uW8<n'n��nͽQ�
�gԞ�+Z	���{���G�Ĭ� �t�]�p;躆 ��.�ۣ�������^��n�ut�L �W��+ ���hO��^�w�\i� ��:9>3�=��So�2v���U1z��.�^�ߋěN���,���� �f��V�    IEND�B`�           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
[remap]

path="res://camera_movement.gdc"
      [remap]

path="res://char_movement.gdc"
        �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      _global_script_classes             _global_script_class_icons             application/config/name         Puzzle Game    application/run/main_scene         res://Scene.tscn   application/config/icon         res://icon.png     display/window/size/width            display/window/size/height      �      display/window/size/test_width            display/window/size/test_height      X     display/window/stretch/mode         2d  
   input/left`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      unicode           echo          script         input/right`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      unicode           echo          script         input/up`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   W      unicode           echo          script      
   input/down`              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   S      unicode           echo          script      )   rendering/environment/default_environment          res://default_env.tres               