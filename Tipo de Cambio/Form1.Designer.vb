<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form reemplaza a Dispose para limpiar la lista de componentes.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Requerido por el Diseñador de Windows Forms
    Private components As System.ComponentModel.IContainer

    'NOTA: el Diseñador de Windows Forms necesita el siguiente procedimiento
    'Se puede modificar usando el Diseñador de Windows Forms.  
    'No lo modifique con el editor de código.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.Boton = New System.Windows.Forms.Button()
        Me.compra = New System.Windows.Forms.TextBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.venta = New System.Windows.Forms.TextBox()
        Me.SuspendLayout()
        '
        'Boton
        '
        Me.Boton.Location = New System.Drawing.Point(196, 138)
        Me.Boton.Name = "Boton"
        Me.Boton.Size = New System.Drawing.Size(117, 23)
        Me.Boton.TabIndex = 0
        Me.Boton.Text = "Tipo de Cambio"
        Me.Boton.UseVisualStyleBackColor = True
        '
        'compra
        '
        Me.compra.Location = New System.Drawing.Point(89, 44)
        Me.compra.Name = "compra"
        Me.compra.Size = New System.Drawing.Size(100, 20)
        Me.compra.TabIndex = 1
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(28, 44)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(43, 13)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "Compra"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(28, 95)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(35, 13)
        Me.Label2.TabIndex = 3
        Me.Label2.Text = "Venta"
        '
        'venta
        '
        Me.venta.Location = New System.Drawing.Point(89, 95)
        Me.venta.Name = "venta"
        Me.venta.Size = New System.Drawing.Size(100, 20)
        Me.venta.TabIndex = 4
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(336, 184)
        Me.Controls.Add(Me.venta)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.compra)
        Me.Controls.Add(Me.Boton)
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Form1"
        Me.Text = "Tipo de Cambio"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Boton As Button
    Friend WithEvents compra As TextBox
    Friend WithEvents Label1 As Label
    Friend WithEvents Label2 As Label
    Friend WithEvents venta As TextBox
End Class
