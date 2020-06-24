package com.an.TestRunner;

import cucumber.api.CucumberOptions;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.Assert.*;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.apache.commons.io.FileUtils;
import org.junit.Test;

//https://github.com/intuit/karate/blob/master/karate-demo/src/test/java/demo/DemoTestParallel.java

//@RunWith(Karate.class)
@CucumberOptions(features ="src/main/java/com/an/qa/Features",tags = {"@ignore"})
public class TestRunner 
{
	 @Test
	    public void testParallel() {
	        Results results = Runner.parallel(getClass(), 5);
	        generateReport(results.getReportDir());
	        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
	    }

	    public static void generateReport(String karateOutputPath) {
	        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
	        List<String> jsonPaths = new ArrayList(jsonFiles.size());
	        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
	        Configuration config = new Configuration(new File("target"), "Karate_WIP_api");
	        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
	        reportBuilder.generateReports();
	    }

}