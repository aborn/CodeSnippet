
public static void main(String[] args){
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    //return "redirect:/index.html?c=scene&key=hot";
    for (Map.Entry<String, EleDataAtom> entry : eleDataAtomMap.entrySet()) {
    }
    String[] strings = os.trim().split("\\s+");

    Calendar cal = Calendar.getInstance();
    // Specific Day 2017.3.16 00:00:00
    cal.set(2017, Calendar.MARCH, 16, 0, 0, 0);
    Date date = cal.getTime();

    // url decode using java
    String result = java.net.URLDecoder.decode(url, "UTF-8");// java ArrayList swap elements
    Collections.swap(List<?> list, int i, int j);

    try {
        //方法一:采用IOUtils
        InputStream inputStream = request.getInputStream();
        String rs = IOUtils.toString(inputStream);

        // 方法二:分段读
        final int bufferSize = 1024;
        final char[] buffer = new char[bufferSize];
        final StringBuilder out = new StringBuilder();
        Reader in = new InputStreamReader(inputStream, "UTF-8");
        for (; ; ) {
            int rsz = in.read(buffer, 0, buffer.length);
            if (rsz < 0)
                break;
            out.append(buffer, 0, rsz);
        }

        JSONArray jsonArray = JSONArray.parseArray(out.toString());
    } catch (IOException e) {
        APISysLog.warn("", e);
    }

    // java 7 随机int区间
    int randomNum = ThreadLocalRandom.current().nextInt(min, max + 1);
}


/**
 * 判断是否完成了所有审核！！
 * 判断当前用户执行审核通过之后（当前用户能提交，则肯定是具有相应审核权限的），审核工作是否已经完成
 * 完成的条件应该是: recordDTO中保存的reviewType + 当前用户审核的 reviewType = 当前运营位所需要的所有reviewType
 * @return
 * @param attribute  运营位的审核属性
 * @param reviewResultVo  当前用户的审核信息
 * @param recordDTO   数据库中已经拥有的审核信息
 * @return
 */
private boolean isFinishReview(SceneAttribute attribute,ReviewResultVo reviewResultVo,RecordDTO recordDTO) {
    List<Integer> allReviewType = new ArrayList<Integer>();
    if (attribute.isHasVisionReview()) {
        allReviewType.add(RecordReviewEnum.VISION.getValue());
    }

    if (attribute.isHasContentReview()) {
        allReviewType.add(RecordReviewEnum.CONTENT.getValue());
    }

    List<Integer> hasReviewType = new ArrayList<Integer>();
    if (StringUtils.isNotBlank(recordDTO.getViewInfo())) {
        RecordViewInfo recordViewInfo = JSONObject.parseObject(recordDTO.getViewInfo(), RecordViewInfo.class);
        for (ReviewEvent reviewEvent : recordViewInfo.getEvents()) {
            hasReviewType.add(reviewEvent.getReviewType());
        }
    }

    for (Integer reviewType : reviewResultVo.getReviewList()) {
        hasReviewType.add(reviewType);
    }

    return allReviewType.size() == hasReviewType.size();
}
