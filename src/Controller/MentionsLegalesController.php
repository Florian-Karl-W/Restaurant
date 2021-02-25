<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class MentionsLegalesController extends AbstractController
{

  /**
   * @Route("/mentionslegales", name="mentionslegales")
   */
  public function mentionslegales()
  {
    return $this->render('mentionslegales/mentionslegales.html.twig');

  }

}
