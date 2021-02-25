<?php

namespace App\Form;

use App\Entity\Reservation;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ReservationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('firstname', TextType::class, [
                'label' => 'Prénom',
            ])
            ->add('lastname', TextType::class, [
                'label' => 'Nom',
            ])
            ->add('phone', IntegerType::class, [
                'label' => 'Numéro de téléphone',
            ])
            ->add('nbperson', IntegerType::class, [
                'label' => 'Nombre de personne',
            ])
            ->add('date', DateTimeType::class, [
                'label' => 'Date pour laquelle vous réservez',
            ])
            ->add('allergies', TextareaType::class)
            ->add('Num_table', TextType::class, [
                'label' => 'Numéro de table',
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Reservation::class,
            "allow_extra_fields" => true,
        ]);
    }
}
