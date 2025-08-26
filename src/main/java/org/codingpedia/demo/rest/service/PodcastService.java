package org.codingpedia.demo.rest.service;

import java.sql.SQLException;
import java.util.List;

import org.codingpedia.demo.rest.errorhandling.AppException;
import org.codingpedia.demo.rest.errorhandling.CustomReasonPhraseException;
import org.codingpedia.demo.rest.resource.podcast.Podcast;

/**
 * 
 * @author ama
 * @see <a href="http://www.codingpedia.org/ama/spring-mybatis-integration-example/">http://www.codingpedia.org/ama/spring-mybatis-integration-example/</a>
 */
public interface PodcastService {
	
	/*
	 * ******************** Create related methods **********************
	 * */
	Long createPodcast(Podcast podcast) throws AppException;
	void createPodcasts(List<Podcast> podcasts) throws AppException;

		
	/*
	 ******************** Read related methods ********************
	  */ 	
	/**
	 * 
	 * @param orderByInsertionDate - if set, it represents the order by criteria (ASC or DESC) for displaying podcasts
	 * @param numberDaysToLookBack - if set, it represents number of days to look back for podcasts, null 
	 * @return list with podcasts coressponding to search criterias
	 * @throws AppException
	 */
	List<Podcast> getPodcasts(String orderByInsertionDate, Integer numberDaysToLookBack) throws AppException;
	
	/**
	 * Returns a podcast given its id
	 * 
	 * @param id
	 * @return
	 * @throws AppException 
	 */
	Podcast getPodcastById(Long id) throws AppException;
	
	
	/*
	 * ******************** Update related methods **********************
	 * */	
	void updateFullyPodcast(Podcast podcast) throws AppException;
	void updatePartiallyPodcast(Podcast podcast) throws AppException;
	
		
	/*
	 * ******************** Delete related methods **********************
	 * */
	void deletePodcastById(Long id);
	
	/** removes all podcasts */
	void deletePodcasts();

	/*
	 * ******************** Helper methods **********************
	 * */
	Podcast verifyPodcastExistenceById(Long id);
	
	/**
	 * Empty method generating a Business Exception
	 * @throws CustomReasonPhraseException
	 */
	void generateCustomReasonPhraseException() throws CustomReasonPhraseException;

}
