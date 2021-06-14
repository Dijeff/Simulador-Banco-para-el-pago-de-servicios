Public Class Form1
    Private Sub Boton_Click(sender As Object, e As EventArgs) Handles Boton.Click

        Dim resultado1 As New DataSet 'Dataset para recibir respuesta del Webservice
        Dim resultado2 As New DataSet
        Dim webserv As New servicio.wsIndicadoresEconomicosSoapClient 'Se instancia Webservice para llamarlo
        resultado1 = webserv.ObtenerIndicadoresEconomicos("317", "29/09/2019", "29/09/2019", "FIO", "N") ' se realiza la llamada con los parámetros requeridos
        resultado2 = webserv.ObtenerIndicadoresEconomicos("318", "29/09/2019", "29/09/2019", "FIO", "N") ' se realiza la llamada con los parámetros requeridos

        Dim wbcompra As String 'Para guardar el tipo de cambio
        Dim wbventa As String 'Para guardar el tipo de cambio

        wbcompra = resultado1.Tables(0).Rows(0)(2).ToString() 'Para traer la columna 3 del dataset que es donde está almacenado el tipo de cambio
        wbventa = resultado2.Tables(0).Rows(0)(2).ToString()

        compra.Text = wbcompra
        venta.Text = wbventa

    End Sub
End Class
