<?php

namespace App\Controller;

use App\Entity\Product;
use App\Entity\Category;
use App\Form\CategoryType;
use App\Form\ProductType;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    /**
     * @Route("/product", name="product")
     */
    public function product(ProductRepository $repo)
    {
        $product = new Product();
        $form = $this->createForm(ProductType::class, $product);
        $repo = $this->getDoctrine()->getRepository(Product::class);
        $product = $repo->findAll();
        $category = $repo->findAll();
        return $this->render('product/product.html.twig', [
            'controller_name' => 'ProductController',
            'products' => $product,
            'categories' => $category,
            'productForm' => $form->createView(),
        ]);
    }
}
