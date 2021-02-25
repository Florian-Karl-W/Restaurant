<?php

namespace App\Controller;

use App\Entity\Product;
use App\Form\ProductccType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Twig\Environment;

class ProductccController extends AbstractController
{
    /**
     * @Route("/productcc", name="productcc")
     */
    public function show(Environment $twig, Request $request, EntityManagerInterface $entityManger)
    {
        $product = new Product();

        $formcc = $this->createForm(ProductccType::class, $product);

        $formcc->handleRequest($request);

        if ($formcc->isSubmitted() && $formcc->isValid()) {
            $entityManger->persist($product);
            $entityManger->flush();
        }

        return $this->render('dashboard/productedit.html.twig', [
            'productccForm' => $formcc->createView()
        ]);
    }
}
