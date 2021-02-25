<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class MenuController extends AbstractController
{
  /**
   * @Route("/menu", name="menu")
   * @Template
   */
  public function menu()
  {
    $logo = false;
    return [
      'controller_name' => 'MenuController',
      'logo' => $logo
    ];
  }
}
