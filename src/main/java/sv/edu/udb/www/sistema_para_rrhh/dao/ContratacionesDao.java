package sv.edu.udb.www.sistema_para_rrhh.dao;

import sv.edu.udb.www.sistema_para_rrhh.modelo.Contratacion;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ContratacionesDao
{
    public List<Contratacion> listar(){
        List<Contratacion> contratacionesMock = new ArrayList<>();
        contratacionesMock.add(
                new Contratacion(
                        0,
                        "RRhhh",
                        "norma",
                        "abogado",
                        "plaza fija",
                        new Date(),
                        1000.00,
                        "activo"
                )
        );

        contratacionesMock.add(
                new Contratacion(
                        0,
                        "RRhhh",
                        "diego",
                        "abogado",
                        "plaza fija",
                        new Date(),
                        1000.00,
                        "activo"
                )
        );

        contratacionesMock.add(
                new Contratacion(
                        0,
                        "RRhhh",
                        "maria",
                        "abogado",
                        "plaza fija",
                        new Date(),
                        1000.00,
                        "activo"
                )
        );

        contratacionesMock.add(
                new Contratacion(
                        0,
                        "RRhhh",
                        "benjamin",
                        "abogado",
                        "plaza fija",
                        new Date(),
                        1000.00,
                        "activo"
                )
        );

        return contratacionesMock;
    }
}
