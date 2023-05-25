export CUDA_VISIBLE_DEVICES=$1
export HF_HOME="/mnt/Data1/akann1w0w1ck/AlanTuring/.cache"
export TRANSFORMERS_CACHE="/mnt/Data1/akann1w0w1ck/.cache/transformers"

python3 ./prompt_engineering/langchain/predict.py --llm_name TheBloke/gpt4-x-vicuna-13B-HF --prompt_style yes_no \
    --parse_style rule_based --ensemble_size 1 --effect_type directly --edge_value binary_weight \
    --input_file ./data/spot/spot_indicator_mapping_table_test.csv --k_shot_b2i 0 --k_shot_i2i 0 \
    --k_shot_example_dset_name_b2i spot --k_shot_example_dset_name_i2i None --local_or_remote local \
    --batch_size 10 --save_output &&


python3 ./prompt_engineering/langchain/predict.py --llm_name TheBloke/wizard-vicuna-13B-HF --prompt_style yes_no \
    --parse_style rule_based --ensemble_size 1 --effect_type directly --edge_value binary_weight \
    --input_file ./data/spot/spot_indicator_mapping_table_test.csv --k_shot_b2i 0 --k_shot_i2i 0 \
    --k_shot_example_dset_name_b2i spot --k_shot_example_dset_name_i2i None --local_or_remote local \
    --batch_size 10 --save_output 