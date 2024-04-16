import random
import os
from faker import Faker

# 创建 Faker 对象，并指定语言为中文简体
fake = Faker('zh_CN')

def generate_random_sentences(output_dir, num_sentences):
    total_characters = 0
    sentences = []

    for _ in range(num_sentences):
        # 生成随机中文句子
        sentence = fake.sentence()
        sentences.append(sentence)
        total_characters += len(sentence)

    # 确保目录存在
    os.makedirs(output_dir, exist_ok=True)

    # 将句子列表保存到文件
    output_file = os.path.join(output_dir, f"sent_{num_sentences}句_{total_characters}字.txt")
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sentences))

    print(f"已生成 {num_sentences} 句随机中文句子，共 {total_characters} 字到文件 {output_file} 中。")

while True:
    # 输入要生成的句子数量
    num_sentences = int(input("请输入要生成的句子数量："))

    # 生成句子文件
    generate_random_sentences(r'D:\Homework\SWE\20240416_软件质量评测\文本\random_sent', num_sentences)
