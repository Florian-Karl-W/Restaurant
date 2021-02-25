<?php

namespace App\Controller;

use App\Entity\Product;
use App\Entity\Reservation;
use App\Form\ProductccType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use App\Form\ReservationType;

use Doctrine\ORM\EntityManagerInterface;

class DashboardController extends AbstractController
{
  /**
   * @Route("/dashboard", name="dashboard")
   */
  public function index()
  {
    $repo = $this->getDoctrine()->getRepository(Reservation::class);
    $reservation = $repo->findAll();
    return $this->render('dashboard/index.html.twig', [
      "controller_name" => `ReservationController`,
      "reservations" => $reservation,
    ]);
  }

  /**
   *  @Route("/dashboard/{id}", name="dashboard-delete", requirements={"id":"\d+"}))
   */
  public function delete(Reservation $reservation, EntityManagerInterface $entityManager)
  {
    $entityManager->remove($reservation);
    $entityManager->flush();

    return $this->redirectToRoute('dashboard');
  }

  /**
   *  @Route("/dashboard/edit/{id}", name="dashboard-edit")
   */
  public function edit($id, Request $request)
  {
    $reservation = $this->getDoctrine()->getRepository(Reservation::class)->find($id);
    $form = $this->createForm(ReservationType::class, $reservation);
    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
      $entityManager = $this->getDoctrine()->getManager();
      $entityManager->flush();

      $this->addFlash("reservation_edit_success", "Réservation modifiée avec succès");
      return $this->redirectToRoute('dashboard');
    }

    return $this->render('dashboard/edit.html.twig', [
      "form" => $form->createView()
    ]);
  }

  /**
   *  @Route("/dashboard/ccproduct", name="ccproduct")
   */
  public function ccproduct()
  {
    $repo = $this->getDoctrine()->getRepository(Product::class);
    $product = $repo->findAll();
    return $this->render('dashboard/ccproduct.html.twig', [
      "controller_name" => `ProductController`,
      "products" => $product,
    ]);
  }
  /**
   *  @Route("/dashboard/ccproduct/{id}", name="ccproduct-delete")
   */
  public function ccdproductdelete($id)
  {
    $entityManager = $this->getDoctrine()->getManager();
    $product = $entityManager->getRepository(Product::class)->find($id);

    $entityManager->remove($product);
    $entityManager->flush();

    return $this->redirectToRoute('ccproduct');
  }

  /**
   *  @Route("/dashboard/product/edit/{id}", name="ccproduct-edit")
   */
  public function productedit($id, Request $request)
  {
    $product = $this->getDoctrine()->getRepository(Product::class)->find($id);
    $formcc = $this->createForm(ProductccType::class, $product);
    $formcc->handleRequest($request);

    if ($formcc->isSubmitted() && $formcc->isValid()) {
      $entityManager = $this->getDoctrine()->getManager();
      $entityManager->flush();

      $this->addFlash("product-edit_edit_success", "Modification effectuée avec succès");
      return $this->redirectToRoute('ccproduct');
    }

    return $this->render('dashboard/productedit.html.twig', [
      "productccForm" => $formcc->createView()
    ]);
  }
  /**
   * @Route("/dashboard/product/add", name="ccproduct-add")
   */
  public function addproduct(Request $request)
  {
    $product = new Product;
    $form = $this->createForm(ProductccType::class, $product);
    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
      $entityManager = $this->getDoctrine()->getManager();
      $entityManager->persist($product);
      $entityManager->flush();

      $this->addFlash("product_add_success", "Product ajouté avec succès");
      return $this->redirectToRoute('ccproduct');
    }

    return $this->render('dashboard/productadd.html.twig', [
      "productccForm" => $form->createView()
    ]);
  }
}
