package com.jboss.rest.service;

import com.jboss.rest.entity.City;
import com.jboss.rest.entity.State;

import java.awt.print.Book;
import java.util.List;
import javax.inject.Inject;
import javax.persistence.EntityManager;

import javax.persistence.Query;
import javax.ws.rs.*;


@Path("/service")
public class MyService {

    @Inject
    private EntityManager em;

    @GET
    @Produces("application/json")
    @Path("/liststates")
    public List<State> listAllStates() {

        Query query = em.createQuery("FROM com.jboss.rest.entity.State");
        List <State> stateList =  query.getResultList();

        return stateList;
    }

   @GET
   @Produces("application/json")
   @Path("/listcitiesbystate/")
   public List<City> listAllCitiesByState(@QueryParam("uf")String uf) {

      Query query = em.createQuery("FROM com.jboss.rest.entity.City c where c.uf =:uf ").setParameter("uf",uf);
        List <City> cityList =  query.getResultList();

        return cityList;
   }
}
