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
public class Profile {
    @Id
    @Column(name = "UserID", nullable = false)
    private Integer id;

    @MapsId
    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "UserID", nullable = false)
    private User user;

    @Column(name = "FirstName", nullable = false, length = 50)
    private String firstName;

    @Column(name = "LastName", length = 50)
    private String lastName;

    @Column(name = "Address", nullable = false, length = 500)
    private String address;

    @Column(name = "Balance", nullable = false, precision = 19, scale = 4)
    private BigDecimal balance;

}