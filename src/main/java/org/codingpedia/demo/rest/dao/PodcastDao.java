package org.codingpedia.demo.rest.dao;

import java.util.List;

/**
 * 
 * @author ama
 * @see <a href="http://www.codingpedia.org/ama/spring-mybatis-integration-example/">http://www.codingpedia.org/ama/spring-mybatis-integration-example/</a>
 */
public interface PodcastDao {
	
	List<PodcastEntity> getPodcasts(String orderByInsertionDate);

	List<PodcastEntity> getRecentPodcasts(int numberOfDaysToLookBack);
	
	/**
	 * Returns a podcast given its id
	 * 
	 * @param id
	 * @return
	 */
	PodcastEntity getPodcastById(Long id);
	
	/**
	 * Find podcast by feed
	 * 
	 * @param feed
	 * @return the podcast with the feed specified feed or null if not existent 
	 */
	PodcastEntity getPodcastByFeed(String feed);

	void deletePodcastById(Long id);

	Long createPodcast(PodcastEntity podcast);

	void updatePodcast(PodcastEntity podcast);

	void deletePodcasts();

}
