<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class ContactController extends AbstractController
{
    /**
     * @Route("/contact", name="contact")
     * @Template
     */
    public function contactAction(): array
    {
        return [
            'controller_name' => 'ContactController',
        ];
    }
}
