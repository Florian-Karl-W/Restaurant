<?php

namespace App\Controller;

use App\Entity\Reservation;
use App\Form\ReservationType;
use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Twig\Environment;

class ReservationController extends AbstractController
{

    /**
     * @Route("/reservation", name="reservation")
     */
    public function show(Environment $twig, Request $request, EntityManagerInterface $entityManger)
    {
        $reservation = new Reservation();

        $form = $this->createForm(ReservationType::class, $reservation);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManger->persist($reservation);
            $entityManger->flush();
        }

        return $this->render('reservation/reservation.html.twig', [
            'reservationForm' => $form->createView()
        ]);
    }
}
