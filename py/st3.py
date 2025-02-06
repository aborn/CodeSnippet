import matplotlib.pyplot as plt

# 年份数据
years = [2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024]
# 人均 GDP 数据
per_capita_gdp = [49922, 53980, 59201, 64644, 70892, 72447, 80976, 85698, 91422, 98532]

# 计算人均 GDP 增长率
growth_rates = [0]
for i in range(1, len(per_capita_gdp)):
    growth_rate = (per_capita_gdp[i] - per_capita_gdp[i - 1]) / per_capita_gdp[i - 1]
    growth_rates.append(growth_rate)

# 设置中文字体，这里以冬青黑体为例，根据实际情况修改字体路径
from matplotlib import font_manager
font_path = '/System/Library/Fonts/Hiragino Sans GB.ttc'
font = font_manager.FontProperties(fname=font_path)

# 解决负号显示问题
plt.rcParams['axes.unicode_minus'] = False

# 绘制人均 GDP 曲线
plt.plot(years, per_capita_gdp, marker='o', linestyle='-', color='g')

# 标注人均 GDP 增长率
for i in range(len(years)):
    plt.text(years[i], per_capita_gdp[i], f'{growth_rates[i]:.2%}',
             ha='center', va='bottom', fontproperties=font, color='r')

# 设置 x 轴刻度为每年
plt.xticks(years)

# 设置 y 轴刻度，根据数据范围和需求调整
min_gdp = min(per_capita_gdp)
max_gdp = max(per_capita_gdp)
step = 2000  # 刻度间隔设置为 10000
y_ticks = list(range(int(min_gdp // step) * step, int((max_gdp // step + 1) * step), step))
plt.yticks(y_ticks)

# 设置图表标题
plt.title('近 10 年中国人均 GDP 变化趋势', fontproperties=font)
# 设置 x 轴标签
plt.xlabel('年份', fontproperties=font)
# 设置 y 轴标签
plt.ylabel('人均 GDP（元）', fontproperties=font)

# 显示网格线，仅显示 x 轴网格线在每年对应的位置
plt.grid(axis='both', which='major', linestyle='--', color='gray')

# 显示图表
plt.show()
