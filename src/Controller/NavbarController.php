<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class NavbarController extends AbstractController
{

    /**
     * @Route("/navbar", name="navbar")
     */
    public function navbar()
    {
        return $this->render('navbar.html.twig');
    }
  
}