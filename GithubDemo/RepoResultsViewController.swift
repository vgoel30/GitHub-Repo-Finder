//
//  ViewController.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit
import MBProgressHUD

// Main ViewController
class RepoResultsViewController: UIViewController, UITableViewDataSource {
    
    var searchBar: UISearchBar!
    var searchSettings = GithubRepoSearchSettings()
    
    @IBOutlet weak var tableView: UITableView!
    var repos: [GithubRepo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self
        tableView.dataSource = self
       // tableView.estimatedRowHeight = 200
       // tableView.rowHeight = UITableViewAutomaticDimension
        
        // Add SearchBar to the NavigationBar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        // Perform the first search when the view controller first loads
        doSearch()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GitHubCell", forIndexPath: indexPath) as! GitHubCell

        cell.repository = self.repos[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repos.count
    }
    
    // Perform the search.
    private func doSearch() {
        
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        
        // Perform request to GitHub API to get the list of repositories
        GithubRepo.fetchRepos(searchSettings, successCallback: { (newRepos) -> Void in
            
            // Print the returned repositories to the output window
            for repo in newRepos {
                //print(repo)
            }
            
                self.repos = newRepos
                self.tableView.reloadData()
                print(self.repos)
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            }, error: { (error) -> Void in
                print(error)
        })
        
    }
    
    
}

// SearchBar methods
extension RepoResultsViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true;
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchSettings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }
}