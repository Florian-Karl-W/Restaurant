<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class FooterController extends AbstractController
{

    /**
     * @Route("/footer", name="footer")
     */
    public function footer()
    {
        return $this->render('footer.html.twig');
    }
  
}