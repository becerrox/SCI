
<?php
    //-----------------------------------------------------------------------------------
    //    Ejemplo básico de utilización de fPDF
    //-----------------------------------------------------------------------------------
    require('fpdf.php');
    $pdf=new FPDF();
    $pdf->AddPage();
    $pdf->SetFont('Arial','B',16);
    $pdf->Cell(40,10,utf8_decode('Hola Mundo ón!') );
    $pdf->Output();

    class PDF extends FPDF
  {
     // Cabecera de página
     function Header()
         {
           $this->Image('images/cabecera.png', 10, 10, 100, 28);
           $this->SetFont('Arial','B',15);
           $this->SetXY(110,20);
           $this->Cell(90,10,utf8_decode('IMPRESIÓN DE REGISTRO'),0,0,'C');
           $this->Ln(25);
         }
                        
      // Pie de página
     function Footer()
         {
           $this->SetY(-15);
           $this->SetFont('Arial','I',8);
           $this->Cell(0,10,utf8_decode('Página ').$this->PageNo().' de {nb}   - - - -   Impreso el ' . FechaActualCompleta() . ' a las ' . date('H:i:s') . ' hora del servidor',0,0,'C');
         }
 }
 ?>
