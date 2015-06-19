# Coursera, Getting and Cleaning Data Project Assignment Code Book

### About result data
The script produce 2 result txts, one named "merged_data.txt" is the cleaned data, the other named "data_with_mean.txt" is the mean of each subject and activity.

##### merged_data.txt
| column       | description                                              | type    |
| ------------ | -------------------------------------------------------- | ------- |
| subject      | Id of the subject                                | integer |
| activity     | Label of the activity                                    | factor  |
| mean  | Mean of variables by Subject + Activity provided in merged_data | numeric |

##### data_with_mean.txt
| Column                       | Description                 |
| ---------------------------- | --------------------------- |
| Activity                     | Activity when data produce  |
| Subject                      | Research subject            |
| Others                       | Only std and mean from data |




### About original data

You can get information about original data from url down there:
* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* https://github.com/myplaylife/GettingAndCleaningDataPeerAssignment/blob/master/data/features_info.txt
* https://github.com/myplaylife/GettingAndCleaningDataPeerAssignment/blob/master/data/README.txt
