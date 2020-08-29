VERSION 5.00
Begin VB.Form test 
   BackColor       =   &H00404040&
   Caption         =   "Date Convert Test"
   ClientHeight    =   3204
   ClientLeft      =   108
   ClientTop       =   432
   ClientWidth     =   7452
   LinkTopic       =   "Form1"
   ScaleHeight     =   3204
   ScaleWidth      =   7452
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton gc 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Convert"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   7.8
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   1872
      UseMaskColor    =   -1  'True
      Width           =   1092
   End
   Begin VB.TextBox gd 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   10.2
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   3732
      TabIndex        =   6
      Top             =   1872
      Width           =   492
   End
   Begin VB.TextBox gm 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   10.2
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   2940
      TabIndex        =   5
      Top             =   1872
      Width           =   492
   End
   Begin VB.TextBox gy 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   10.2
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   1776
      TabIndex        =   4
      Top             =   1872
      Width           =   852
   End
   Begin VB.CommandButton jc 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Convert"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   7.8
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   4440
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   984
      UseMaskColor    =   -1  'True
      Width           =   1092
   End
   Begin VB.TextBox jd 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   10.2
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   3732
      TabIndex        =   2
      Top             =   984
      Width           =   492
   End
   Begin VB.TextBox jm 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   10.2
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   2940
      TabIndex        =   1
      Top             =   984
      Width           =   492
   End
   Begin VB.TextBox jy 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   10.2
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   1776
      TabIndex        =   0
      Top             =   984
      Width           =   852
   End
   Begin VB.Label j 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      Caption         =   "Gregorian"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   10.2
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   252
      Index           =   7
      Left            =   6012
      TabIndex        =   15
      Top             =   1932
      Width           =   1020
   End
   Begin VB.Label j 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      Caption         =   "Jalali"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   10.2
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   252
      Index           =   6
      Left            =   6072
      TabIndex        =   14
      Top             =   1044
      Width           =   528
   End
   Begin VB.Label j 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      Caption         =   "-"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   10.2
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   252
      Index           =   5
      Left            =   3540
      TabIndex        =   13
      Top             =   1932
      Width           =   84
   End
   Begin VB.Label j 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      Caption         =   "-"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   10.2
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   252
      Index           =   4
      Left            =   2724
      TabIndex        =   12
      Top             =   1932
      Width           =   84
   End
   Begin VB.Label j 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   10.2
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   252
      Index           =   3
      Left            =   3516
      TabIndex        =   11
      Top             =   1044
      Width           =   120
   End
   Begin VB.Label j 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      Caption         =   "/"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   10.2
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   252
      Index           =   2
      Left            =   2736
      TabIndex        =   10
      Top             =   1044
      Width           =   120
   End
   Begin VB.Label j 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      Caption         =   "„Ì·«œÌ"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   10.2
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   252
      Index           =   1
      Left            =   840
      TabIndex        =   9
      Top             =   1932
      Width           =   660
   End
   Begin VB.Label j 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H00404040&
      BackStyle       =   0  'Transparent
      Caption         =   "Â‹ ‘„”Ì"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   10.2
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   252
      Index           =   0
      Left            =   456
      TabIndex        =   8
      Top             =   1044
      Width           =   1092
   End
End
Attribute VB_Name = "test"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub gc_Click()
 
 out = gregorian_to_jalali(gy, gm, gd)
 jy = out(0)
 jm = out(1)
 jd = out(2)

End Sub

Private Sub jc_Click()
 
 out = jalali_to_gregorian(jy, jm, jd)
 gy = out(0)
 gm = out(1)
 gd = out(2)
 
End Sub
