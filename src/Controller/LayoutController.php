<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class LayoutController extends AbstractController
{

    /**
     * @Route("/layout", name="layout")
     */
    public function layout()
    {
        return $this->render('layout.html.twig');
    }
  
}