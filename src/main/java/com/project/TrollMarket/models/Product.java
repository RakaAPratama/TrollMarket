package com.project.TrollMarket.models;

import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ProductID", nullable = false)
    private Integer id;

    @Column(name = "ProductName", nullable = false, length = 100)
    private String productName;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "SellerID", nullable = false)
    private User sellerID;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "CategoryID", nullable = false)
    private Category categoryID;

    @Column(name = "Price", nullable = false, precision = 19, scale = 4)
    private BigDecimal price;

    @Lob
    @Column(name = "Description")
    private String description;

    @Column(name = "Discontinue", nullable = false)
    private Boolean discontinue = false;

}