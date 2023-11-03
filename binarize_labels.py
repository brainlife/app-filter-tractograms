#!/usr/bin/env python3

def main():

    with open('config.json','r') as config_f:
        config = json.load(config_f)

    labels = config['labels']
    labels_df = pd.read_csv(labels,header=None)
    labels_df_cleaned = labels_df.copy()
    labels_df_cleaned[0] = [ 1 if f > 0 else 0 for f in labels_df[0] ]

    labels_df_cleaned.to_csv('labels.csv',index=False)

if __name__ == "__main__":
    main()