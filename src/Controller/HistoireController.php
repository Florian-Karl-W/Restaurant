<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class HistoireController extends AbstractController
{

  /**
   * @Route("/histoire", name="histoire")
   * @Template
   */
  public function histoire()
  {
    return [
      'controller_name' => 'HistoireController',
    ];
  }
}
